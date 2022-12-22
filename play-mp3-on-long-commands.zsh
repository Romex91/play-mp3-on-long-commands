mp3_long_commands_sound_preexec() {
  timer=${timer:-$SECONDS}
  export MP3_LONG_COMMANDS_TIME=""
}

mp3_long_commands_sound_precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    if [ -n "$TTY" ] && [ $timer_show -ge ${MP3_LONG_COMMANDS_MIN_SECONDS:-3} ]; then
      afplay $MP3_LONG_COMMANDS_SOUND_PATH
    fi
    unset timer
  fi
}

precmd_functions+=(mp3_long_commands_sound_precmd)
preexec_functions+=(mp3_long_commands_sound_preexec)
