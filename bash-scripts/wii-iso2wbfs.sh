#!/bin/bash
FILE="/media/games/scripts/compressroms-variables.txt"
source $FILE

# Magic stuff
cd "$wii_input"
unp ./*.*      # Unpack all SHOULD do is ONLY unpackable formats and error for no dependencies should not stop the script.


for f in *.iso; do
  wit copy --wbfs "$f" "$wii_output/%T [%I]/%+"      # change copy to convert for deleting the original file
done

# https://wit.wiimm.de/info/iso-images.html#esc
