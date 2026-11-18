#!/usr/bin/env bash
# Mainnet contract-deployment probe.
#
# Attempts to deploy a trivial empty contract to a non-authorized mainnet
# account. Used to verify, from a non-service-account perspective, whether
# /storage/isContractDeploymentRestricted is in effect.
#
# Interpret result textually (no inverted exit-code convention):
#   "deploy SUCCEEDED"  -> restriction is NOT active (expected BEFORE the multisig)
#   "deploy REJECTED"   -> restriction IS active     (expected AFTER  the multisig)
#
# Usage:
#   ./run_probe.sh <tag>
#
# <tag> is suffixed into the contract name so repeat runs don't collide with
# a previously-deployed probe contract (updates are always allowed and would
# bypass the restriction).
#
# Config:
#   PROBE_CONFIG  path to flow.json containing the mainnet signer
#                 (default: /Users/vishal/testkey/flow.json — out of tree)
#   PROBE_SIGNER  account name in PROBE_CONFIG       (default: vishalmainnet)

set -u

TAG="${1:?usage: run_probe.sh <tag>   (e.g. pre | post | 20261118a)}"
PROBE_CONFIG="${PROBE_CONFIG:-/Users/vishal/testkey/flow.json}"
PROBE_SIGNER="${PROBE_SIGNER:-vishalmainnet}"

if [[ ! -f "$PROBE_CONFIG" ]]; then
    echo "error: PROBE_CONFIG not found: $PROBE_CONFIG" >&2
    exit 2
fi

# Sanitize tag -> valid Cadence identifier chars only
SAFE_TAG="$(printf '%s' "$TAG" | tr -c '[:alnum:]_' '_')"
CONTRACT_NAME="DeploymentProbe_${SAFE_TAG}"

TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT
CONTRACT_PATH="$TMPDIR/${CONTRACT_NAME}.cdc"

cat > "$CONTRACT_PATH" <<EOF
access(all) contract ${CONTRACT_NAME} {
    init() {}
}
EOF

echo "----------------------------------------------------------------"
echo "Probe: deploying ${CONTRACT_NAME}"
echo "  network: mainnet"
echo "  signer : ${PROBE_SIGNER}  (from ${PROBE_CONFIG})"
echo "----------------------------------------------------------------"

OUTPUT=$(flow accounts add-contract "$CONTRACT_PATH" \
    --network mainnet \
    --signer "$PROBE_SIGNER" \
    -f "$PROBE_CONFIG" 2>&1)
RC=$?

echo "$OUTPUT"
echo "----------------------------------------------------------------"

if [[ $RC -eq 0 ]] && echo "$OUTPUT" | grep -q "Contracts Deployed" ; then
    echo "RESULT: deploy SUCCEEDED → restriction is NOT active"
    exit 0
fi

if echo "$OUTPUT" | grep -qE "deploying contract failed|not authorized|requires authorization"; then
    echo "RESULT: deploy REJECTED → restriction IS active"
    exit 1
fi

echo "RESULT: ambiguous outcome — inspect CLI output above"
exit 2
