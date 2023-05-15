#!/bin/bash
# Use quotes ("")

FILE="/media/games/scripts/compressroms-variables.txt"
source $FILE

# No need to edit under this line
for f in "$ps2-input"/*.iso; do
  "$zso_py_dir" -c 2 "$f" "$ps2-zso-output/DVD/$(basename "$f" .iso).zso"
#  rm "$f"    # Uncomment this if you want to delete the originale files
done