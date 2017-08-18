#!/bin/bash
# This script searches (greps) the notes contents for a specific (provided)
# keyword and presents its line when an explicit CLI command is involved.
# Commands are made explicit in the notes by adding >>> in front of the command.

#SCRIPT_PATH="`dirname \"$0\"`"

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SCRIPT_PATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

grep -irh --color "^>>>.*"$1".*: " ${SCRIPT_PATH}/contents/

