# What is this?

This is a set of scripts for merging multiple directories into one with 
the use of symbolic links.  It is inspired by git and the libraries in 
Windows 7.

I find that I can't fit all my media on one drive, so its spread over multiple 
drives.  In my `$HOME` folder I have Music and Videos and what-not, so I 
wanted all the content of each type to be present in the folders in my `$HOME` 
folder but clearly can't fit everything physically in that folder.

# Installation

I haven't done the remote installer yet, but you can install it manually 
by copying the `usr` folder to your `/` directory as root.

# How do I use it?

## Initialize
First initialize your library:

	$ cd ~/Music
	$ libs init
	
## Adding folders
Then add a folder to it:

	$ libs add /media/data/music
	$ libs add /media/data2/music
	$ libs add /media/data3/albums
	
OK so you can see all the folders that will be merged when you do this:

	$ libs list
	/media/data/music
	/media/data2/music
	/media/data3/albums
	
## Scanning folders
And now we need to scan the folders to link all the folders together:

	$ libs scan
	Scanning folders for library /home/you/Music
	
	Scanning /media/data/music...
	Scanning /media/data2/music...
	Scanning /media/data3/albums...
	
	Done

Now when you look in your Music folder you should see the contents of all 
three folders combined.

But want to start over?  Just reset the library:

	$ libs reset
	
Look in the folder... all gone!  This process only removes links and empty 
folders so you should be able to keep stuff in the folder safely... you made 
backups just in case though right?

## Removing folders

Want to remove a folder?  Use the remove function:

	$ libs remove /media/data/music
	$ libs list
	/media/data2/music
	/media/data3/albums
	
Omitting the folder from remove will give you a text based menu:

	$ libs remove
	Folders currently indexed by this library:

	1: /media/data2/music
	2: /media/data3/albums

	Which folder to remove? q
	
	Removing none...

You will need to reset and scan again for the changes to take place though:

	$ libs reset
	$ libs scan
	
## Experimental (I haven't tested this)
You can also scan all your libraries at the same time by going:

	$ libs scan --all
	
If you find this works well you could add it to your 
	
## GUI

You can also try out the quick and dirty GUI by running:

	libs-gui /home/you/Music # WARNING: Use absolute path names
	
You should be to do this from ALT+F2 (in Gnome) however.

# Feedback
Any suggestions/questions/feedback don't hesitate to email me at robert.mcleod@itpeople.co.nz
