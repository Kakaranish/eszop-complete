#!/bin/bash

dotnet_ver=$(dotnet --version)
if [ $? -ne 0 ] ; then
    echo "[ERROR] Missing dotnet"
    exit
fi

IFS='.' read -ra split_dotnet_ver <<< $dotnet_ver
major_dotnet_ver=${split_dotnet_ver[0]}

if [[ $major_dotnet_ver -lt 5 ]] ; then
    echo "[ERROR] Minimum version of dotnet is 5. Detected version ${major_dotnet_ver}"
fi