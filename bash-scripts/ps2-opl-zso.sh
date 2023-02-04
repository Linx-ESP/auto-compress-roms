# Use quotes ("")
import_dir="/path/original/files"
zso_py_dir="/path/for/script" # MUST include /opl-ziso.py or /ziso.py or what name it has.
opl_dvd_dir="/path/for/OpenPS2Loader" # Should end in /OpenPS2Loader if you use SMB in OPL. In no case in /DVD or /CD

# Dont need to edit under this line
for f in "$import_dir"/*.iso; do "$zso_py_dir" -c 2 "$f" "$opl_dvd_dir/DVD/$(basename "$f" .iso).zso"; rm "$f"; done
