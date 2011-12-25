#!/bin/bash

function add_folder {
	
	if [ "$1" = "" ]; then
		echo "No folder name given!";
		exit 1;
	fi;
	
	check_in_library;
	
	# Is the folder already added?
	if [ `get_folders|grep $1|wc -l` = "0" ]; then
		echo $1 >> `get_folder_list`;
	fi;
	
	echo "Added folder $1";
}
