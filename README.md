# Bash and Zsh scripts to play a sound when long scripts finish executing. Useful for multitasking.
https://www.loom.com/share/88d5ac579aee42829db33b3d8eae74ff

## Installation
* **Linux-only** `sudo apt install mpg123`
* `git clone https://github.com/Romex91/play-mp3-on-long-commands.git ~/play-mp3-on-long-commands`
* Edit `~/.bashrc` on Linux or `~/.zshrc` on MacOS:
```bash
MP3_LONG_COMMANDS_MIN_SECONDS=10
MP3_LONG_COMMANDS_SOUND_PATH=~/play-mp3-on-long-commands/long_commands_sound.mp3
MP3_LONG_COMMANDS_IGNORED_COMMANDS=("vim" "sudo vim" "nano" "sudo nano" "cypress" "git commit" "git rebase", "git diff", "git log")
source ~/play-mp3-on-long-commands/add-me-to-bashrc-or-zshrc.sh
```

## How to know if it is working?
* Run `sleep 11` (or larger number if you customized MP3_LONG_COMMANDS_MIN_SECONDS)
* It it works, you should hear the sound
