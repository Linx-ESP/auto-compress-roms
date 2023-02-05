# WIP/10

Might end up in a docker container or something more useful, for now, bash scripts go brrr...  
I know barely enough for this, don't expect good code.  


## What it's meant to do  
- Take input file
- .zip/.7z/.rar - extract (not yet)
- .iso - reformat/compress
  - Wii: .wbfs
    - Might need a (.nkit extract) or want (.rvz to .iso) first
  - Dolphin: .rvz [NOT possible in headless server]
    - Might need a (.nkit extract) or want (.wbfs to .iso) first
  - CEMU: .wua
  - PS2: .zso
    - Might need a (.bin + .cue to .iso) first
  - Xbox 360: GoD (Games on Demand)
  - ...
- Take compressed rom and move it to the correct folder (meant for games over SMB and similar). 
- Delete .iso (easy to change in the bash script, might add exceptions in some consoles if there is no compressed format alternative).

### Current usage
- Download the bash scripts, the 3rd party scripts (from original repo if possible, the ones in this act as a backup).
- Create the folders per console
  - One should be for the original files
  - One or more for the finished files
- Set the paths in the scripts (import, destination, and 3rd party scripts if needed).
  - By default it deletes the .iso, easy to change in the bash script.
- Run the bash script.  

#### Recommended paths (similar to *arr apps)
- roms
  - PS2
    - OpenPS2Loader
      - DVD
  - Wii
    - Dolphin/rvz
    - wbfs
- import (you could make into the downloads of *arr clients)
  - PS2
  - Wii
  - ...  
- scripts (ssd for example)

  
#### Self-contained paths
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
  
### Dependencies  
- By default
  - unp (p7zip-full, unzip, etc)
- PS2
  - [This python script from OPL](https://github.com/ps2homebrew/Open-PS2-Loader/blob/master/pc/ziso.py)
  - pip + lz4
- Wii
  - .rvz requieres Dolphin-emu. [How to](https://github.com/dolphin-emu/dolphin/pull/10252)
  - .wbfs with [Wimm's ISO Tools](https://wit.wiimm.de/)
  - ~~.nkit with [NKit](https://gbatemp.net/download/nkit.36157/) via [Mono](https://www.mono-project.com/)~~

### TO DO
- Install required dependencies
- ¿Use system-wide $PATH?
- Run at folder change / webUI
- PS2 zso via [maxcso](https://github.com/unknownbrackets/maxcso) or similar instead of python


## More info
It could be done so it identifies the console and executes the correct script/conversion by itself using Redump and No-Intro hashes, but that's above what I can do.  
Nkit is viable via Mono on Linux, but doesn't seem to be widely use today. I'll probably not integrated it here.  
[Script-Server](https://github.com/bugy/script-server) and [Unpackrr](https://github.com/Unpackerr/unpackerr) might be useful.  
You can use Cron jobs and command aliases.
