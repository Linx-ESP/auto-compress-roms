#!/bin/bash
# Use quotes ("")
import_dir="/path/original/files/ps2"
opl_dvd_dir="/path/for/OpenPS2Loader" # Should end in /OpenPS2Loader if you use SMB in OPL. In no case in /DVD or /CD



zso_py_dir="/media/games/scripts/opl-ziso.py" # The install script installs it at "/media/games/scripts/opl-ziso.py"

# No need to edit under this line
for f in "$import_dir"/*.iso; do
  "$zso_py_dir" -c 2 "$f" "$opl_dvd_dir/DVD/$(basename "$f" .iso).zso"
#  rm "$f"    # Uncomment this if you want to delete the originale files
done