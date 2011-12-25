#!/bin/bash

function init() {

	LIBRARY=$1;
	CONFDIR=$LIBRARY/.library;

	if [ -e $CONFDIR ]; then
		add_library $LIBRARY;
		echo "Library already initialized";
		exit 0;
	fi;

	mkdir $CONFDIR;
	touch $CONFDIR/list;

	add_library $LIBRARY;
	echo "Library initialized";	
}
