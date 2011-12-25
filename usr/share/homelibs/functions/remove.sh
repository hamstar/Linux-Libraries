#!/bin/bash

function remove_folder_menu() {
	
	if [ `get_folders|wc -l` = "0" ]; then
		echo "No folders to remove";
		exit 1;
	fi;
	
	echo "Folders currently indexed by this library:";
	echo;
	
	COUNT=1;
	for folder in `get_folders`; do
		echo "$COUNT: $folder";
		FOLDERS[$COUNT]=$folder;
		COUNT=$(($COUNT+1));
	done;
	
	echo;
	echo -n "Which folder to remove? ";
	read FOLDER_INDEX;
	
	if ! [[ "$FOLDER_INDEX" =~ ^[0-9]+$ ]]; then
		echo;
		echo "Removing none...";
		exit 0;
	fi;
	
	if [ "${FOLDERS[$FOLDER_INDEX]}" = "" ]; then
		echo;
		echo "Invalid index...";
		exit 1;
	fi;
	
	remove_folder ${FOLDERS[$FOLDER_INDEX]};
}

function remove_folder() {
	
	if [ "$1" = "" ]; then
		echo "No folder given for removal!";
		exit 1;
	fi;
	
	grep -v "$1" `get_folder_list` > `get_folder_list`;
	RETURN=$?;
	
	if [ "$RETURN" = "0" ]; then
		echo;
		echo "Removed.";
	fi;
	
	exit $?;
}
