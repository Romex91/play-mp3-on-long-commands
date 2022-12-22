# Bash and Zsh scripts to play a sound when long scripts finish executing. Useful for multitasking.
https://www.loom.com/share/88d5ac579aee42829db33b3d8eae74ff

## Installation
### Linux
* Download `play-mp3-on-long-commands.sh` and `long_commands_sound.mp3` to home directory(~)
* `sudo apt install mpg123`
* Edit `~/.bashrc`
```bash
MP3_LONG_COMMANDS_MIN_SECONDS=20
MP3_LONG_COMMANDS_SOUND_PATH=~/long_commands_sound.mp3
source ~/play-mp3-on-long-commands.sh
```
### MacOS
* Download `play-mp3-on-long-commands.zsh` and `long_commands_sound.mp3` to home directory(~)
* Edit `~/.zshrc`
```bash
MP3_LONG_COMMANDS_MIN_SECONDS=20
MP3_LONG_COMMANDS_SOUND_PATH=~/long_commands_sound.mp3

source ~/play-mp3-on-long-commands.zsh
```

## How to know if it is working?
* Run `sleep 21` (or larger number if you customized MP3_LONG_COMMANDS_MIN_SECONDS)
* It it works, you should hear the sound
