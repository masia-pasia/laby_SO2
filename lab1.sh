#!/bin/bash

SOURCE_DIR=${1:-"lab_uno"}
RM_LIST=${2:-"2remove"}
TARGET_DIR=${3:-"bakap"}

if [[ ! -d "$TARGET_DIR" ]]; then
	echo "There is no $TARGET_DIR directory"
	echo "Creating $TARGET_DIR directory..."
	mkdir $TARGET_DIR
fi

while read FILE; do
	if  [[ -f "${SOURCE_DIR}/${FILE}" ]]; then
		echo "Removing $FILE file from $SOURCE_DIR directory"
		rm "${SOURCE_DIR}/${FILE}"
fi	
done < "$RM_LIST"


for FILE in $(ls -R "$SOURCE_DIR"); do
		if [ ! -f "$RM_LIST" ] && [ -f "$FILE" ]; then
			mv "$FILE" "$TARGET_DIR"
			echo "Moving $FILE file from $SOURCE_DIR directory to $TARGET_DIR directory"
		elif [ ! -f "$RM_LIST" ] && [ -d "$FILE" ]; then
			cp -R "$FILE" "$TARGET_DIR"
			echo "Copying $FILE directory from $SOURCE_DIR directory to $TARGET_DIR directory"
		else
			echo "Nothing to move or to copy"
		fi
done

TODAY=$(date '+%Y-%m-%d')
ZIP_FILE="bakap_${TODAY}.zip"
echo "Creating zip archive of ${TARGET_DIR} directory..."
zip -r "${ZIP_FILE}" "${TARGET_DIR}"
		
#do 20 linijki wszystko git, idk dlaczego nie czyta ani plikow regularnych
#ani folderow, trzeba jeszcze dodac zipa

#for FILE in "$SOURCE_DIR"/*; do
#	if [ ! -f "$RM_LIST" ] && [ -f "$FILE" ]; then
#		mv "$FILE" "$TARGET_DIR"
#		echo "Moving $FILE file from $SOURCE_DIR directory to "$TARGET_DIR" #directory"
#	elif [ ! -f "$RM_LIST" ] && [ -d "$FILE" ]; then
#		cp -R "$FILE" "$TARGET_DIR"
#		echo "Coping $FILE directory from $SOURCE_DIR directory to "$TARGET_DIR" #directory"
#	else
#		echo "Nothing to move or to copy"
#	fi
#done
