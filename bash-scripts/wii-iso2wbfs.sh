#!/bin/bash
# Doesnt convert iso to rvz. Converts to wbfs.
# Use quotes ("")
import_dir="/path/original/files"
#rvz_dir="/path/for/rvz"
wbfs_dir="/path/for/wbfs"


# Dont edit under this line
cd "$import_dir"
unp ./*.*      # Unpack all SHOULD do is ONLY unpackable formats and error if no dependencies should not stop the script.

# Nkit extract TO-DO
# Conversion to rvz requires full Dolphin (not doable in headless server?)

for f in *.iso; do
  wit convert --wbfs "$f" "$wbfs_dir/%T [%I]/%+"      # https://wit.wiimm.de/info/iso-images.html#esc
done

#mv ./*.rvz "$rvz_dir"
#mv ./*.wbfs "$wbfs_dir"
