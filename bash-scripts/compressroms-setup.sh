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
"PlayStation 2/OpenPS2Loader/APPS"\
"PlayStation 2/OpenPS2Loader/ART"\
"PlayStation 2/OpenPS2Loader/CD"\
"PlayStation 2/OpenPS2Loader/CFG"\
"PlayStation 2/OpenPS2Loader/CHT"\
"PlayStation 2/OpenPS2Loader/DVD"\
"PlayStation 2/OpenPS2Loader/LNG"\
"PlayStation 2/OpenPS2Loader/POPS"\
"PlayStation 2/OpenPS2Loader/THM"\
"PlayStation 2/OpenPS2Loader/VMC"

echo Might need relogin. You are ready to run compressroms.