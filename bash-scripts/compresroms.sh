#!/bin/bash

# ================ Should point to help =================
if [[ "$1" == "" ]]; then
    echo "No argument. Please specify 'gamecube' , 'wii', 'ps2'."

# ================== Nintendo Consoles ==================
elif [[ "$1" == "gamecube" ]]; then
    bash /media/games/scripts/gc-iso2ciso.sh

elif [[ "$1" == "wii" ]]; then
    bash /media/games/scripts/wii-iso2wbfs.sh

# ==================== Sony Consoles ====================
elif [[ "$1" == "ps2" ]]; then
    bash /media/games/scripts/ps2-opl-iso2zso.sh

# ======================== Error ========================
else
    echo "Invalid argument. Valid arguments are:
    gamecube
    wii
    ps2"
fi