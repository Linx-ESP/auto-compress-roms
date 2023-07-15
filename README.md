# WIP, but usable

## Save space on your games ROMs

Most emulators or consoles allow to use different formats for games so you don't have to storage a full 8GB from a DVD since most of it will be blank.

You will probably want to use [Nkit2](https://github.com/Nanook/NKit) once it releases.

##### I will try to properly comment the code with sources and reasoning for those who want to work or fork it.

## What it's meant to do

- Take input file
  - .iso
- Compress and output
  - GameCube: .ciso
  - Wii: .wbfs
  - PS2: .zso
  - ...
- Take compressed rom and move it to the correct folder (meant for games over SMB or loaders that require certain folder structure).
- Keeps original .iso (you can manually edit the script to delete)

#### Other formats (To do)

- Xbox 360 - `GoD` (Games on Demand)
  - From extracted/folder format and .iso
  - Compatible with OG Xbox too (playing OG Xbox games on X360 console)
- CEMU: .wua
- NDS + 3DS: `trimm .nds & .3ds`
  - Usually you do this at the time of dumping, might not do it.

---

### How to use

#### APT based distros (Ubuntu, Debian...)

Run `curl -sSL https://raw.githubusercontent.com/Linx-ESP/auto-compress-roms/main/bash-scripts/install.sh | sudo bash`

- Requires SUDO

Set paths, run command:
`compressroms-setup`

Run the command (might need relogin)  
`compressroms`  
`compressroms gamecube`  
`compressroms wii`  
`compressroms ps2`

- Cron jobs can help automate this. Careful in keeping the original files, better to delete them.

### Notes

- `Failed to detect file type of`
  - This is not a problem. Unp (unpack) will output this for each file that is not a .zip/.tar/.rar/...
- Multidisc games
  - Testing

### Automatic paths

```
Import path (set using compressroms-setup)
    ../gc
    ../wii
    ../ps2

Output path (set using compressroms-setup)
    ../PS2/OpenPS2Loader (For OPL SMB Share)
        ../DVD
        ../CD
    ../Wii
    ../GameCube
```

You can point certains folder to a removable drive, such as a usb hard drive for the Wii.

- Edit /etc/fstab so it mounts the drive with the same path if needed.

---

### Dependencies (auto-installed)

- By default
  - `unp` (`p7zip-full`, `unzip`, etc)
  - `ansible`
- PS2
  - [This python script from OPL](https://github.com/ps2homebrew/Open-PS2-Loader/blob/master/pc/ziso.py)
  - `pip3` + lz4
- Wii/GameCube
  - [Wimm's ISO Tools](https://wit.wiimm.de/)
  - [This RVZ tool](https://github.com/bodgit/rvz)

### TO DO

- Setup individiual path in a more interactive way
  - Full TUI
- Dolphin .rvz support improved
- Integrate with cockpit

## More info

- It could be done so it identifies the console and executes the correct script/conversion by itself using Redump and No-Intro hashes, requiring only one input folder. But that's above what I can do.
- Nkit seems viable via Mono on Linux, but doesn't seem to be widely use today. I'll probably not integrated it here.
- [Script-Server](https://github.com/bugy/script-server) might be useful.
  - [RetroNAS](https://github.com/danmons/retronas) caused me issues as I use my NAS for more than that, but useful for a dedicated server.
- Might end up in a docker container, probably if I add full Dolphin support. For now, ansible + bash scripts go brrr...
