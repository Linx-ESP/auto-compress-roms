# WIP, but usable

## Save space on your games ROMs

Most emulators or consoles allow to use different formats for games so you don't have to storage a full 8GB from a DVD since most of it will be blank.

This scripts allow

##### I will try to properly comment the code with sources and reasoning for those who want to work or fork it.

## What it's meant to do

- Take input file
- .iso - reformat/compress
  - GameCube: .ciso
  - Wii: .wbfs
  - PS2: .zso
    - Might need a `.bin + .cue to .iso` first
  - ...
- Take compressed rom and move it to the correct folder (meant for games over SMB or loaders that require certain folder structure).
- Keeps original .iso (you can manually edit the script to delete)

#### Other formats (To do)

- Xbox 360 - `GoD` (Games on Demand)
  - From extracted/folder format and .iso
  - Compatible with OG Xbox too (playing OG Xbox games on X360 console)
- CEMU: .wua
- Dolphin: `.rvz` [¿Not possible in headless server?]
  - `NKit` via Mono, seems to be less used than .rvz, not a priority
- NDS + 3DS: `trimm .nds & .3ds`
  - Usually you do this at the time of dumping, might not do it.

---

### How to use

#### APT based distros (Ubuntu, Debian...)

Run `curl -sSL https://raw.githubusercontent.com/Linx-ESP/auto-compress-roms/main/bash-scripts/install.sh | sudo bash`

- Requires SUDO

Edit the the input and output on the script files:  
`/media/games/scripts/...`

Run the command (might need relogin)  
`compressroms`  
`compressroms gamecube`  
`compressroms wii`  
`compressroms ps2`

- Cron jobs can help automate this. Careful in keeping the original files, better to delete them.

### Notes

- `fatal: [localhost]: FAILED! => {"changed": false, "module_stderr": "sudo: a password is required\n", "module_stdout": "", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 1}`
  - Do any other sudo command so it asks you for the password (sudo apt update for example). Will look how to fix it.
- `Failed to detect file type of`
  - This is not a problem. Unp (unpack) will output this for each file that is not a .zip/.tar/.rar/...
- Multidisc games
  - Testing

### Recommended paths

```
/media/games (example)
    ../games/roms
          ../roms/PS2
               ../PS2/OpenPS2Loader (For OPL SMB Share)
                              ../DVD
                              ../CD
          ../roms/Wii
               ../Wii/wbfs
               ../Wii/rvz (for dolphin)
          ../roms/GameCube
               ../GameCube/ciso/..

Mirrored for imported games, before compressing
    ../games/import
          ../import/PS2
                 ../PS2/OpenPS2Loader (For OPL SMB Share)
                              ../DVD
                              ../CD
          ../import/Wii
                 ../Wii/wbfs
                 ../Wii/rvz (for dolphin)
    ...etc...
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

### TO DO

- ¿Use system-wide `$ENV` for game paths + interactive via dialog or similar?
  - All paths one file, kind of a local ENV file?
- Create single command. E.g

```
compressroms wii (compress wii iso to wbfs) - DONE
compressroms ps2 (compress iso ps2) - DONE
compressroms editpaths (dialog or similar for interactive path selection and no more file editing)
compressroms editpaths wii-output (use pwd/actual path as wii output)
```

- Run at folder change
- Integrate with cockpit

## More info

- It could be done so it identifies the console and executes the correct script/conversion by itself using Redump and No-Intro hashes, requiring only one input folder. But that's above what I can do.
- Nkit seems viable via Mono on Linux, but doesn't seem to be widely use today. I'll probably not integrated it here.
- .rvz requires Dolphin. Haven't be able to install it in a headless server, will check again sometime.
- [Script-Server](https://github.com/bugy/script-server) and [Unpackrr](https://github.com/Unpackerr/unpackerr) might be useful.
  - [RetroNAS](https://github.com/danmons/retronas) caused me issues as I use my NAS for more than that, but useful for a dedicated server.
- Might end up in a docker container, probably if I add Dolphin support. For now, ansible + bash scripts go brrr...
