#!/bin/bash

# Checks the library can be scanned
function check_can_scan_library() {
	
	LIBRARY=$1;

	############# Preconditions #############
	if [ "$LIBRARY" = "" ]; then
	  echo "No library given!";
	  exit 1;
	fi;

	if [ ! -e $LIBRARY/.library ]; then
	  echo "Given library is not initialized!";
	  exit 2;
	fi;

	if [ ! -e $LIBRARY/.library/list ]; then
	  echo "No folders to scan!";
	  exit 3;
	fi;

	if [ `get_folders|wc -l` = "0" ]; then
	  echo "No folders to scan!";
	  exit 4;
	fi;
	#########################################
}

# Scans the folders in the libary and relinks files
function scan() {

	LIBRARY=$1;
	check_can_scan_library $LIBRARY;
	RETURN=0;
	echo "Scanning folders for library $LIBRARY";
	echo

	for FOLDER in `get_folders $LIBRARY`; do
	  
	  echo "Scanning $FOLDER...";
	  cp -sRf $FOLDER/* $LIBRARY/;
	  
	  if [ "$?" != 0 ]; then
		RETURN=5;
	  fi;
	done;

	exit $RETURN;
}

function scan_all() {

	for LIBRARY in get_libaries; do

		if [ `is_a_library $LIBRARY` = "1" ]; then
			scan $LIBRARY;
		else
			remove_library $LIBRARY;
		fi;
	done;

	exit 0;
}
