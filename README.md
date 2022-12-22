# Scripts to play a sound when long scripts finish executing. Useful for multitasking.
https://www.loom.com/share/88d5ac579aee42829db33b3d8eae74ff

## Installation
### Linux
* download `play-mp3-on-long-commands.sh` and `~/long_commands_sound.mp3` to home directory(~)
* `sudo apt install mpg123`
* Edit ~/.bashrc
```bash
MP3_LONG_COMMANDS_MIN_SECONDS=3
MP3_LONG_COMMANDS_SOUND_PATH=~/long_commands_sound.mp3
source ~/play-mp3-on-long-commands.sh
```
### MacOS
* download `play-mp3-on-long-commands.zshrc` and `~/long_commands_sound.mp3` to home directory(~)
* `brew install mpg123`
* Edit ~/.zshrc
```bash
MP3_LONG_COMMANDS_MIN_SECONDS=3
MP3_LONG_COMMANDS_SOUND_PATH=~/long_commands_sound.mp3

source ~/play-mp3-on-long-commands.zshrc
```
