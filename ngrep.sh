#!/bin/bash
# This script searches (greps) the notes contents for a specific (provided)
# keyword and presents its line when an explicit CLI command is involved.
# Commands are made explicit in the notes by adding >>> in front of the command.



#
# DETERMINE RUNNING DIRECTORY
#

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SCRIPT_PATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"



#
# FUNCTIONS
#

function printHelp () {
echo -e "NGREP - Notes Grep (2017, GNU GENERAL PUBLIC LICENSE)\n"
echo -e "USAGE: ngrep [-n] <search-pattern>\n"
echo -e "Arguments:"
echo -e "   -n Normal grep"
echo -e "   -h Prints this helptext."
}

function getInput () {
	local OPTIND n h option
	while getopts nh option
	do
		case "${option}"
		    in
		    n) SEARCHMETHOD=normal;;
		    h)
		      printHelp
		      exit 0
		    ;;
		    \?)
		      printHelp
		      exit 1
		    ;;
	    esac
	  done
}



#
# LOGIC
#

getInput "$@"
if [ "$SEARCHMETHOD" = "normal" ]; then
	grep -ir --color $2 ${SCRIPT_PATH}/contents/
else
	grep -ir --color '^>>>.*'$1'.*: .*[\$#]' ${SCRIPT_PATH}/contents/
fi
