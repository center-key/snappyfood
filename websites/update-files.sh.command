#!/bin/sh
##################################
# Snappy Food                    #
# Update files for FTP to server #
##################################

projectHome=$(cd $(dirname $0)/..; pwd)
publishWebRoot=$(grep ^DocumentRoot /private/etc/apache2/httpd.conf | awk -F\" '{ print $2 }')
publishFolder=$publishWebRoot/centerkey.com
webServerUrl=http://localhost/centerkey.com

copyGraphics() {
   cd $projectHome/websites
   echo "Graphics:"
   cp -v ../graphics/bookmark.png             www.snappyfood.org/graphics
   cp -v ../graphics/rice-bowl.png            www.snappyfood.org/graphics
   cp -v ../graphics/rice-bowl-card.png       www.snappyfood.org/graphics
   cp -v ../graphics/rice-bowl-mobile.png     www.snappyfood.org/graphics/mobile-home-screen.png
   cp -v ../graphics/bookmark.png             www.dragonsgrill.org/graphics
   cp -v ../graphics/dragons-grill.png        www.dragonsgrill.org/graphics
   cp -v ../graphics/dragons-grill-card.png   www.dragonsgrill.org/graphics
   cp -v ../graphics/dragons-grill-mobile.png www.dragonsgrill.org/graphics/mobile-home-screen.png
   echo
   }

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
   echo "Done."
   echo
   }

echo
echo "Update Files"
echo "============"
copyGraphics
test -w $publishFolder && updateFiles
