# Doesnt convert iso to rvz. Converts to wbfs.
# Use quotes ("")
import_dir="/path/original/files"
rvz_dir="/path/for/rvz"
wbfs_dir="/path/for/wbfs"


# Dont edit under this line
cd "$import_dir"; unp *.*; 

# Nkit extract TO-DO

for f in *.iso; do wit convert --wbfs "$f" .; done; 

mv *.rvz "$rvz_dir"; mv *.wbfs "$wbfs_dir"
