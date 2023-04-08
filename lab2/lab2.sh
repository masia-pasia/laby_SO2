#!/bin/bash

PATH_1=${1:-}
PATH_2=${2:-}

if [[ ! -d "$PATH_1" ]]; then
	echo "There is no $PATH_1 directory"
	exit
elif [[ ! -d "$PATH_2" ]]; then
	echo "There is no $PATH_2 directory"
	exit
fi

ls $PATH_1

for FILE in ${PATH_1}/*; do
F=${FILE##*/}
	if [[ -d ${FILE} ]]; then
		echo "${F} is a directory"
		#{$FILE^^} to uppercase
		#set -x
		ln -s $FILE ${PATH_2%/*}/${F^^}_ln
	elif [[ -L "$FILE" ]]; then
		echo "$F is a link"
	elif [[ -f "$FILE" ]]; then
		echo "$F is a regular file"
		ln -s $FILE ${PATH_2/*}/${F^^}_ln
	fi
done


