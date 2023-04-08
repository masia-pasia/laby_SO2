#!/bin/bash

DIR_1=${1:-}

if [[ ! -d "$DIR_1" ]]; then
	echo "There is no $DIR_1 directory"
	exit
fi


for FILE in ${DIR_1}/*; do
F=${FILE##*/}
	if [[ -f "$FILE" ]]; then
		if [[ "$FILE##." == "bak" ]]; then
		chmod a-w $FILE
		fi
	fi
	if [[ -d "$FILE" ]]; then
		if [[ "$FILE##." == "bak" ]]; then
		chmod a-w $FILE
		fi
	fi
