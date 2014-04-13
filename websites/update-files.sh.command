#!/bin/sh
####################################
#  Snappy Food                     #
#  Update files for FTP to server  #
####################################

ftpFolder=~/Sites/centerkey.com
cd $(dirname $0)
echo
echo "Update Files"
echo "============"
echo "Source:"
pwd
ls -l
cp -r www.snappyfood.org   $ftpFolder
cp -r www.dragonsgrill.org $ftpFolder
cp -r www.dragonsgrill.com $ftpFolder
echo "\nDestination:"
cd $ftpFolder
pwd
ls -l | grep www

echo
