#!/bin/sh
##################################
# Snappy Food                    #
# Update files for FTP to server #
##################################

ftpFolder=~/Dropbox/Documents/Sites/centerkey.com
webServerUrl=http://localhost/centerkey.com

cd $(dirname $0)
echo
echo "Update Files"
echo "============"
if [ ! -d $ftpFolder ]; then
   echo "Target not found: $ftpFolder"
   exit
   fi
echo "Source:"
pwd
ls -l
cp -r www.snappyfood.org   $ftpFolder
cp -r www.dragonsgrill.org $ftpFolder
cp -r www.dragonsgrill.com $ftpFolder
echo
echo "Destination:"
cd $ftpFolder
pwd
ls -l | grep www
open $webServerUrl/www.snappyfood.org
open $webServerUrl/www.dragonsgrill.org
open $webServerUrl/www.dragonsgrill.com
