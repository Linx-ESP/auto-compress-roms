#!/bin/bash
# Doesnt convert iso to rvz. Converts to wbfs.
# Use quotes ("")
import_dir="/path/original/files/gamecube"
ciso_dir="/path/output/ciso"


# Magic stuff
cd "$import_dir"
unp ./*.*      # Unpack all SHOULD do is ONLY unpackable formats and the errors for no dependencies should not stop the script.


for f in *.iso; do
ID6=$(wit ID6 "$f")
ID8=$(wit ID8 "$f")
result=${ID8#"$ID6"}
resultnospace=${result:1}
discid=${resultnospace:0:2}
echo ${discid}


  if [ "echo ${discid}" == "00" ]; then                       # For Disc 1 - ID'd as 00
      wit copy --ciso "$f" "$ciso_dir/%I/game.ciso"       # change copy to convert for deleting the original file
  elif [ "echo ${discid}" == "01" ]; then                       # For Disc 2 - ID'd as 00
      wit copy --ciso "$f" "$ciso_dir/%I/disc2.ciso"      # change copy to convert for deleting the original file
  else
      echo "No disc number found"
  fi

  
done

# https://wit.wiimm.de/info/iso-images.html#esc