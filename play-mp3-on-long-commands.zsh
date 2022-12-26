mp3_long_commands_sound_preexec() {
  mp3_lcs_timer=${timer:-$SECONDS}
  mp3_lcs_command=$1
}

mp3_long_commands_sound_precmd() {
  # If command strats from one of MP3_LCS_IGNORED_COMMANDS, ignore it.
  for MP3_LCS_IGNORED_COMMAND in "${MP3_LONG_COMMANDS_IGNORED_COMMANDS[@]}"; do
    if [[ "$mp3_lcs_command" == "$MP3_LCS_IGNORED_COMMAND"* ]]; then
      return
    fi
  done


  if [ $mp3_lcs_timer ]; then
    mp3_lcs_timer_show=$(($SECONDS - $mp3_lcs_timer))
    if [ -n "$TTY" ] && [ $mp3_lcs_timer_show -ge ${MP3_LONG_COMMANDS_MIN_SECONDS:-3} ]; then
      afplay $MP3_LONG_COMMANDS_SOUND_PATH
    fi
    unset mp3_lcs_mp3_lcs_timer
  fi
}

precmd_functions+=(mp3_long_commands_sound_precmd)
preexec_functions+=(mp3_long_commands_sound_preexec)
