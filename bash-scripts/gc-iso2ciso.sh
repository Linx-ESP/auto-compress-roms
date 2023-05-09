#!/bin/bash
# Doesnt convert iso to rvz. Converts to wbfs.
# Use quotes ("")
import_dir="/path/original/files/gc"
ciso_dir="/path/output/ciso"


# Magic stuff
cd "$import_dir"
unp ./*.*      # Unpack all SHOULD do is ONLY unpackable formats and error for no dependencies should not stop the script.


for f in *.iso; do
  wit copy --wbfs "$f" "$ciso_dir/%I/game.ciso"      # change copy to convert for deleting the original file
done

# https://wit.wiimm.de/info/iso-images.html#esc