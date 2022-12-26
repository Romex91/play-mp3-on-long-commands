if [ $SHELL = "/bin/bash" ]; then
  source ~/play-mp3-on-long-commands/play-mp3-on-long-commands.sh
elif [ $SHELL = "/bin/zsh" ]; then
  source ~/play-mp3-on-long-commands/play-mp3-on-long-commands.zsh
else
  echo "play-mp3-on-long-commands.sh: Unsupported shell"
fi
