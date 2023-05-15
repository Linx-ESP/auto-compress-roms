#!/bin/bash
FILE="/media/games/scripts/compressroms-variables.txt"
#source $FILE

read -p "Set path to ROMs to compress: " romsinputvar
read -p "Set path to storage compressed ROMs: " romsoutputvar
echo

sed -i "s@roms-import=.*@roms-import="$romsinputvar"@" "$FILE"
sed -i "s@roms-output=.*@roms-output="$romsoutputvar"@" "$FILE"

echo Will look for ROMs at "$romsinputvar" subfolders and put the compressed ROMs at "$romsoutputvar"

echo Creating folder structure

cd "$romsinputvar"
mkdir -p gc wii ps2 

cd "$romsoutputvar"
mkdir -p \
"Nintendo GameCube"\
"Nintendo Wii"\
"Playstation 2/OpenPS2Loader/APPS"\
"Playstation 2/OpenPS2Loader/ART"\
"Playstation 2/OpenPS2Loader/CD"\
"Playstation 2/OpenPS2Loader/CFG"\
"Playstation 2/OpenPS2Loader/CHT"\
"Playstation 2/OpenPS2Loader/DVD"\
"Playstation 2/OpenPS2Loader/LNG"\
"Playstation 2/OpenPS2Loader/POPS"\
"Playstation 2/OpenPS2Loader/THM"\
"Playstation 2/OpenPS2Loader/VMC"

echo Might need relogin. You are ready to run compressroms.