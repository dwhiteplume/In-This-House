#!/usr/bin/env bash

# get_in_this_house.sh
# A Bash script to frame a custom message in a "house rules" ASCII meme.

set -euo pipefail

usage() {
  cat <<EOF
Usage: $0 [-m message] [-l maxLength]

  -m    Custom message to display between ASCII frames (default: "MESSAGE")
  -l    Maximum allowed character count of the full meme, including frames (default: 300)

Example:
  $0 -m "Respect Brittney Sykes' perimeter defense"
  $0 -m "Stef Dolson’s screens are law" -l 500
EOF
  exit 1
}

# defaults
message="MESSAGE"
maxLength=300

# parse options
while getopts ":m:l:h" opt; do
  case $opt in
    m) message="$OPTARG" ;;
    l) maxLength="$OPTARG" ;;
    h|*) usage ;;
  esac
done

# ASCII art frames
top=$'┏┓
┃┃╱╲in
┃╱╱╲╲this
╱╱╭╮╲╲house
▔▏┗┛▕▔ we
╱▔▔▔▔▔▔▔▔▔▔╲'

bottom=$'╱╱┏┳┓╭╮┏┳┓ ╲╲
▔▏┗┻┛┃┃┗┻┛▕▔'

# assemble meme
meme="$(printf "%s\n%s\n%s\n" "$top" "$message" "$bottom")"

# measure length (including newlines)
length=$(printf "%s" "$meme" | wc -c)

if (( length <= maxLength )); then
  printf "%s\n" "$meme"
else
  printf "Error: %d -gt %d\n" "$length" "$maxLength" >&2
  exit 1
fi
