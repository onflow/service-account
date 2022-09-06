#!/bin/bash

# INPUTS

# Find/Create the correct directory 
# OUTPUT_DIR ../transactions/update-contract/2022/apr-6/
CONTRACT_NAME=$1
YEAR_DATE_PATH="2022/aug-18" # TODO input
CONTRACT_VERSION="797b149ceaaa"

source common.sh

# the directory of the script
OUTPUT_DIR="$DIR/../transactions/update-contract/$YEAR_DATE_PATH"

# Create/Reuse the output folder
if [ -d $OUTPUT_DIR ]
then
    echo "Using output folder $OUTPUT_DIR"
else
    echo "Creating new output folder $OUTPUT_DIR"
    mkdir -p $OUTPUT_DIR
fi

CONTRACT_PATH="$(get_relative_contract_path $CONTRACT_NAME)"
if [ -z "$CONTRACT_PATH" ]
then
  echo "No contract found in the git repo with that name (or multiple found with the same name)"
  exit 1
else
  echo "Found contract in the flow-core-contracts repository"
fi


# Download the contract
DOWNLOADED_CONTRACT_PATH="$OUTPUT_DIR/$CONTRACT_NAME.cdc"
wget -q -O "$DOWNLOADED_CONTRACT_PATH" "$GIT_REPO_RAW/$CONTRACT_VERSION/$CONTRACT_PATH"
if ! [ -s "$DOWNLOADED_CONTRACT_PATH" ] 
then
  echo "No contract downloaded from $GIT_REPO_RAW/$CONTRACT_VERSION/$CONTRACT_PATH"
  exit 1
else
  echo "Downloaded contract"
fi


# Replace contract addresses
replace_addresses "$(cat "$DOWNLOADED_CONTRACT_PATH")" > $DOWNLOADED_CONTRACT_PATH
# convert the contract to a hex string
CONTRACT_HEX=$( cat "$DOWNLOADED_CONTRACT_PATH" | xxd -p -c0 | tr -d '\n')

# Use contract name and hex string to create arguments
ARG_PATH="$OUTPUT_DIR/arguments-update-contract-$CONTRACT_NAME.json"
$( export CONTRACT_HEX="$CONTRACT_HEX" CONTRACT_NAME="$CONTRACT_NAME"; envsubst "\$CONTRACT_NAME,\$CONTRACT_HEX" < "$DIR/contract-update/arg-template.json" > "$ARG_PATH" )
echo "Created json arguments"