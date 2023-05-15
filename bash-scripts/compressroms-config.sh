#!/bin/bash

# ================ Should point to help =================
if [[ "$1" == "" ]]; then
    echo "No argument. Please specify:
        - "gamecube-input <path>"
        - "wii-input <path>"
        - "ps2-input <path>"
        - "gamecube-ciso-output <path>"
        - "wii-wbfs-output <path>"
        - "ps2-zso-output <path>"
        "
else
    sed -i 's/^$1=.*/$1=$2/' /media/games/scripts/compressroms-variables.txt
fi