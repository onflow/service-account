#!/usr/bin/env python3
import argparse
import json
from pathlib import Path

def load_remove_set(path: Path) -> set[str]:
    remove = set()
    for line in path.read_text(encoding="utf-8").splitlines():
        s = line.strip()
        if not s or s.startswith("#"):
            continue
        remove.add(s.lower())
    return remove


def is_address_entry(x) -> bool:
    return isinstance(x, dict) and x.get("type") == "Address" and "value" in x



def main() -> None:
    parser = argparse.ArgumentParser(
        description="Remove Address entries from a Cadence JSON arguments file (top-level list)."
    )
    parser.add_argument("arguments_json", help="Path to arguments.json")
    parser.add_argument("to_remove_txt", help="Path to to_remove.txt (one address per line)")
    parser.add_argument(
        "-o",
        "--output",
        default="arguments.updated.json",
        help="Output JSON path (default: arguments.updated.json)",
    )
    args = parser.parse_args()

    args_path = Path(args.arguments_json)
    remove_path = Path(args.to_remove_txt)
    out_path = Path(args.output)

    data = json.loads(args_path.read_text(encoding="utf-8"))
    remove_set = load_remove_set(remove_path)

    if not isinstance(data, list):
        raise SystemExit("Unexpected JSON shape. Expected a top-level JSON array (list).")

    total_removed = 0
    total_before = 0

    # Iterate through all arguments in the top-level list
    for arg in data:
        if (
            isinstance(arg, dict)
            and arg.get("type") == "Array"
            and isinstance(arg.get("value"), list)
        ):
            before = len(arg["value"])
            total_before += before

            arg["value"] = [
                entry
                for entry in arg["value"]
                if not (
                    is_address_entry(entry)
                    and str(entry["value"]).lower() in remove_set
                )
            ]

            after = len(arg["value"])
            total_removed += (before - after)

    out_path.write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8")

    print(f"Scanned {len(data)} top-level arguments.")
    print(f"Scanned {total_before} entries inside Array arguments.")
    print(f"Removed {total_removed} Address entries.")
    print(f"Wrote: {out_path}")

if __name__ == "__main__":
    main()
