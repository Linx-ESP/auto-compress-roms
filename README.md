# WIP/10

Might end up in a docker container or something more useful, for now, bash scripts go brrr...  
Aliases are your friends.  
I know barely enough for this, don't expect good code.  


### What it should do:  
- Take input file
- .zip/.7z/.rar - extract
- .iso - reforma/compress
  - Wii: wbfs
  - Dolphin: rvz
  - CEMU: wad(?)
  - PS2: zso
  - Xbox 360: GoD
  - ...
- Take compress rom and move it to the correct folder (meant for games over SMB and similar). 

### Dependencies:
- By default
  - unp (p7zip-full, unzip, etc)
- PS2
  - [This python script from OPL](https://github.com/ps2homebrew/Open-PS2-Loader/blob/master/pc/ziso.py)
  - pip + lz4
  
  
It could be done so it identifies the console and executes the correct script/conversion by itself ([RetroNAS](https://github.com/danmons/retronas/wiki/ROM-import) does it for importing games). I don't know how to. :c
