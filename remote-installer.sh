#!/bin/bash

######### Untested! ##########

# Check we have git installed
git --version > /dev/null;
if [ "$?" != "0" ]; then
  echo "Git needs to be installed to install Linux Libraries";
  exit 1;
fi;

# Get CWD
ORIG_DIR=`pwd`;

# Go home
cd;

# Clone into repo
git clone git://github.com/hamstar/Linux-Libraries.git;
if [ "$?" != "0" ]; then
  echo "Unable to clone the repo for some reason";
  exit 1;
fi;

# Copy stuff as root
echo "Copying the files to root";
cd Linux-Libraries;
sudo cp usr / -Rf;
if [ "$?" != "0" ]; then
  echo "Unable to copy the files to the root directory!";
  exit 1;
fi;

# Remove repo
cd;
rm Linux-Libraries -fr;
if [ "$?" != "0" ]; then
  echo "Couldn't remove $HOME/Linux-Libraries!";
fi;

# Go back to CWD
cd $ORIG_DIR;

echo "Done!";
echo;

echo "To uninstall this run the following commands:";
echo;
echo -e "\tsudo rm /usr/share/homelibs -fr";
echo -e "\tsudo rm /usr/bin/libs";
echo -e "\tsudo rm /usr/bin/libs-gui";
echo;