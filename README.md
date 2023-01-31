# WIP/10

Might end up in a docker container or something more useful, for now, bash scripts go brrr...  
Aliases are your friends.  
I know barely enough for this, don't expect good code.  


### What it should do  
- Take input file
- .zip/.7z/.rar - extract (not yet)
- .iso - reformat/compress
  - Wii: .wbfs
    - Might need a (.nkit extract) or (.rvz to .iso) first
  - Dolphin: .rvz
    - Might need a (.nkit extract) or (.wbfs to .iso) first
    - Requires full dolphin installation, not possible in TrueNAS (therefor, not a priority)
  - CEMU: .wua
  - PS2: .zso
    - Might need a (.bin + .cue to .iso) first
  - Xbox 360: GoD (Games on Demand)
  - ...
- Take compressed rom and move it to the correct folder (meant for games over SMB and similar). 
- Delete .iso (easy to change in the bash script, might add exceptions in some consoles if there is no alternative).

### Current usage
- Download the bash scripts, the 3rd party scripts (from original repo if possible, the ones in this act as a backup).
- Create a folder per console, and inside it:
  - Folder for SMB/network share (some consoles expect certain folder structure).
  - Folder for imports (this has to be done per console for now, since it cannot identify what game is for what console).
- Set the paths in the scripts (import, destination, and 3rd party scripts if needed).
  - By default it deletes the .iso, easy to change in the bash script.
- Run the bash script.  

### Example paths  
- roms
  - PS2
    - import
    - OpenPS2Loader
      - DVD
  - Wii
    - import
    - wbfs
    - rvz
  - scripts
    - bash scripts (the originals from this repo)
    - compression scripts (the 3rd party ones)

### Example paths (simlar to *arr apps)
- roms
  - PS2
    - OpenPS2Loader
      - DVD
  - Wii
    - Dolphin/rvz
    - wbfs
- import (you could make into the downloads of *arr clients)
  - scripts
  - PS2
  - Wii
  - etc

### Dependencies  
- By default
  - unp (p7zip-full, unzip, etc)
- PS2
  - [This python script from OPL](https://github.com/ps2homebrew/Open-PS2-Loader/blob/master/pc/ziso.py)
  - pip + lz4
- Wii
  - .rvz requieres Dolphin-emu. [How to](https://github.com/dolphin-emu/dolphin/pull/10252)
  - .wbfs with [Wimm's ISO Tools](https://wit.wiimm.de/)
  
### Too advanced for me :c (just wait... :D) 
It could be done so it identifies the console and executes the correct script/conversion by itself ([RetroNAS](https://github.com/danmons/retronas/wiki/ROM-import) does it for importing games).  
Run the scripts when a new file is added to the import folder (daily cronjob at night is other option if you don't need to have them compress as soon as possible).  
