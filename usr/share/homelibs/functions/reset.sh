#!/bin/bash

function reset_library() {
	
	check_in_library;
	
	find $1 -type l -exec unlink {} \; # remove links
	find $1 -depth -empty -type d -exec rmdir {} \; # remove empty dirs
}
