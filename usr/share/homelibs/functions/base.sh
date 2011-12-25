#!/bin/bash

function create_config_if_not_exists() {
	
	if [ ! -e "$HOME/.config" ]; then
		mkdir $HOME/.config;
	fi;
	
	if [ ! -e $HOME/.config/homelibs ]; then
		mkdir $HOME/.config/homelibs;
	fi;
	
	if [ ! -e $HOME/.config/homelibs/list ]; then
		touch $HOME/.config/homelibs/list;
	fi;
}

function get_folders() {
	
	grep -vP '^#|^$' `pwd`/.library/list;
}

function get_libraries() {
	
	grep -vP '^#|^$' $HOME/.config/homelibs/list;
}

function check_in_library() {
	
	if [ ! -e `pwd`"/.library" ]; then
		echo "Not currently in a library!";
		exit 1;
	fi;
}

function get_library_list() {
	
	echo "$HOME/.config/homelibs/list";
}

function get_folder_list() {
	
	LIBRARY=$1;
	if [ "$LIBRARY" = "" ]; then LIBRARY=`pwd`; fi;
	
	echo "$LIBRARY/.library/list";
}

function is_a_library() {
	
	if [ -e `get_folder_list $1` ]; then
		echo 1;
	else
		echo 0;
	fi;
}

function add_library() {
	
	echo $1 > `get_library_list`;
}

function remove_library() {
	
	grep -v "$1" `get_library_list` > `get_library_list`;
}
