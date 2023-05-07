# WIP/10

Might end up in a docker container or something more useful, for now, bash scripts go brrr...  
I know barely enough for this, don't expect good code.  


## What it's meant to do  
- Take input file
- .iso - reformat/compress
  - Wii: .wbfs
  - PS2: .zso
    - Might need a `.bin + .cue to .iso` first
  - ...
- Take compressed rom and move it to the correct folder (meant for games over SMB and similar). 
- Deletes original .iso (you can manually edit the script not to delete)

#### Other formats (To do)
- Xbox 360 - `GoD` (Games on Demand)
  - From extracted/folder format and .iso
  - Compatible with OG Xbox too (playing OG Xbox games on X360 console)
- CEMU: .wua   
- Dolphin: `.rvz` [Not possible in headless server?]
  - `NKit` via Mono, seems to be less used than .rvz, not a priority
- NDS + 3DS: `trimm .nds & .3ds`
  - Usually you do this at the time of dumping, so don't expect it.

 ===

### Current usage
#### APT based distros (Ubuntu, Debian...)
Run ``curl -sSL https://raw.githubusercontent.com/Linx-ESP/auto-compress-roms/main/bash-scripts/install.sh | sudo bash``

Edit the paths on the script files:
    ``/media/games/scripts/...``

### Recommended paths
```
/media/games (example) 
    ../games/roms  
          ../roms/PS2  
               ../PS2/OpenPS2Loader (For OPL SMB Share)  
                              ../DVD  
                              ../CD  
    ../games/roms  
          ../roms/Wii  
               ../Wii/wbfs  
               ../Wii/rvz (for dolphin)
               
Mirrored for imported games, before compressing
    ../games/import  
          ../import/PS2  
                 ../PS2/OpenPS2Loader (For OPL SMB Share)  
                              ../DVD  
                              ../CD  
    ../games/import  
          ../import/Wii  
                 ../Wii/wbfs  
                 ../Wii/rvz (for dolphin)
```
### Dependencies (auto-installed)
- By default
  - ``unp`` (``p7zip-full``, ``unzip``, etc)
  - ``ansible``
- PS2
  - [This python script from OPL](https://github.com/ps2homebrew/Open-PS2-Loader/blob/master/pc/ziso.py)
  - ``pip3`` + lz4
- Wii  
  - .wbfs with [Wimm's ISO Tools](https://wit.wiimm.de/)

### TO DO
- ¿Use system-wide $ENV?
- Run at folder change / via webUI


## More info
It could be done so it identifies the console and executes the correct script/conversion by itself using Redump and No-Intro hashes, but that's above what I can do.  
Nkit is viable via Mono on Linux, but doesn't seem to be widely use today. I'll probably not integrated it here.  
[Script-Server](https://github.com/bugy/script-server) and [Unpackrr](https://github.com/Unpackerr/unpackerr) might be useful.  
You can use Cron jobs and command aliases.
