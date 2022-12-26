#!/bin/bash

# This will run before any command is executed.
function MP3_LCS_PreCommand() {
  if [ -z "$MP3_LCS_AT_PROMPT" ]; then
    return
  fi
  unset MP3_LCS_AT_PROMPT
  
  MP3_LCS_CMD=$BASH_COMMAND
  MP3_LCS_PRE_COMMAND_START_TIME=$(date +%s.%N)
}
trap "MP3_LCS_PreCommand" DEBUG

# This will run after the execution of the previous full command line.  We don't
# want it PostCommand to execute when first starting a bash session (i.e., at
# the first prompt).
MP3_LCS_FIRST_PROMPT=1
function MP3_LCS_PostCommand() {
  MP3_LCS_AT_PROMPT=1

  if [ -n "$MP3_LCS_FIRST_PROMPT" ]; then
    unset MP3_LCS_FIRST_PROMPT
    return
  fi

  # If MP3_LCS_CMD strats from one of MP3_LCS_IGNORED_COMMANDS, return.
  for MP3_LCS_IGNORED_COMMAND in "${MP3_LONG_COMMANDS_IGNORED_COMMANDS[@]}"; do
    if [[ "$MP3_LCS_CMD" == "$MP3_LCS_IGNORED_COMMAND"* ]]; then
      return
    fi
  done

  # If the previous command took longer than 1 second, print the time.
  MP3_LCS_PRE_COMMAND_END_TIME=$(date +%s.%N)
  MP3_LCS_PRE_COMMAND_DURATION=$(echo "$MP3_LCS_PRE_COMMAND_END_TIME - $MP3_LCS_PRE_COMMAND_START_TIME" | bc)
  if (( $(echo "$MP3_LCS_PRE_COMMAND_DURATION > $MP3_LONG_COMMANDS_MIN_SECONDS" | bc -l) )); then
    mpg123 -q $MP3_LONG_COMMANDS_SOUND_PATH
  fi
}

# If getting conflicts with other libs using PROMPT_COMMAND, rewrite to bash-preexec.
# A similar project using bash-preexec: https://github.com/jichu4n/bash-command-timer
PROMPT_COMMAND="MP3_LCS_PostCommand"
