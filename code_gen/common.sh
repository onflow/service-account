#!/bin/bash
GIT_REPO="https://github.com/onflow/flow-core-contracts"
GIT_REPO_CLONE="https://github.com/onflow/flow-core-contracts.git"
GIT_REPO_RAW="https://raw.githubusercontent.com/onflow/flow-core-contracts"

# script directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

declare -A IMPORT_REPLACEMENTS=( 
    ["0xFUNGIBLETOKENADDRESS"]="0xf233dcee88fe0abe" 
    ["0xFLOWTOKENADDRESS"]="0x1654653399040a61"
    ["0xFLOWFEESADDRESS"]="0xf919ee77447b7497"
    ["0xFLOWSTORAGEFEESADDRESS"]="0xe467b9dd11fa00df"
    ["0xFLOWIDTABLESTAKINGADDRESS"]="0x8624b52f9ddcd04a"
    ["0xSTAKINGPROXYADDRESS"]="0x62430cf28c26d095"
    ["0xLOCKEDTOKENSADDRESS"]="0x8d0e87b65159ae63"
    ["0xQCADDRESS"]="0x8624b52f9ddcd04a"
    ["0xDKGADDRESS"]="0x8624b52f9ddcd04a"
    ["0xEPOCHADDRESS"]="0x8624b52f9ddcd04a"
    ["0xFLOWSERVICEADDRESS"]="0xe467b9dd11fa00df"
)

# Replaces address template strings with core contracts addresses
replace_addresses(){
    # input 
    local s="$1"

    for key in ${!IMPORT_REPLACEMENTS[@]}
    do 
        s="$(echo "$s" | sed "s/$key/${IMPORT_REPLACEMENTS[$key]}/g" )"
    done
    echo "$s" 
}

# gets the relative path of the contract from the repo root by contract name
get_relative_contract_path() {
    local contract_name=$1


    local temp_dir_location=$DIR

    # the temp directory used, within $DIR
    # omit the -p parameter to create a temporal directory in the default location
    local temp_dir=`mktemp -d -p "$temp_dir_location"`

    # check if tmp dir was created
    if [[ ! "$temp_dir" || ! -d "$temp_dir" ]]; then
        echo "Could not create temp dir" >&2
        exit 1
    fi

    # deletes the temp directory
    function cleanup {      
        rm -rf "$temp_dir"
    }

    # register the cleanup function to be called on the EXIT signal
    trap cleanup EXIT

    git clone -q --bare --depth=1 $GIT_REPO_CLONE $temp_dir
    contract_matches=$( cd $temp_dir && git ls-tree --name-only -r HEAD | grep "^contracts/" | grep "/$contract_name.cdc" )      
    rm -rf "$temp_dir"
    if [ "${#contract_matches[@]}" -ne "1" ]
    then
        echo "Contract not found in $GIT_REPO or not unique" >&2
        exit 1
    fi

    echo "${contract_matches[0]}"
}