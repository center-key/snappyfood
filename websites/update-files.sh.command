#!/bin/sh
##################################
# Snappy Food                    #
# Update files for FTP to server #
##################################

projectHome=$(cd $(dirname $0)/..; pwd)
publishWebRoot=$(grep ^DocumentRoot /private/etc/apache2/httpd.conf | awk -F\" '{ print $2 }')
publishFolder=$publishWebRoot/centerkey.com
webServerUrl=http://localhost/centerkey.com

updateFiles() {
   cd $projectHome/websites
   echo "Source:"
   pwd
   ls -l
   cp -r www.snappyfood.org   $publishFolder
   cp -r www.dragonsgrill.org $publishFolder
   cp -r www.dragonsgrill.com $publishFolder
   echo
   echo "Destination:"
   cd $publishFolder
   pwd
   ls -l | grep "snappyfood\|dragonsgrill"
   open $webServerUrl/www.snappyfood.org
   open $webServerUrl/www.dragonsgrill.org
   open $webServerUrl/www.dragonsgrill.com
   echo
   }

echo
echo "Update Files"
echo "============"
if [ -d $publishFolder ]
   then
      updateFiles
   else
      echo "Target not found: $publishFolder"
   fi
echo "Done."
