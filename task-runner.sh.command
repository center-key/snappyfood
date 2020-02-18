#!/bin/bash
##################################
# Snappy Food                    #
# Update files for FTP to server #
##################################

banner="Snappy Food"
projectHome=$(cd $(dirname $0); pwd)

setupTools() {
   cd $projectHome
   echo
   echo $banner
   echo $(echo $banner | sed s/./=/g)
   pwd
   echo
   echo "Node.js:"
   which node || { echo "Need to install Node.js: https://nodejs.org"; exit; }
   node --version
   npm install --no-fund
   npm update
   npm outdated
   echo
   }

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

publishWebFiles() {
   cd $projectHome
   publishWebRoot=$(grep ^DocumentRoot /private/etc/apache2/httpd.conf | awk -F'"' '{ print $2 }')
   publishSite=$publishWebRoot/centerkey.com
   publish() {
      echo "Publishing:"
      echo $publishSite
      cp -R websites/www.* $publishSite
      ls -o $publishSite | grep snappyfood
      ls -o $publishSite | grep dragonsgrill
      open http://localhost/centerkey.com/www.snappyfood.org
      open http://localhost/centerkey.com/www.dragonsgrill.org
      open http://localhost/centerkey.com/www.dragonsgrill.com
      echo
      }
   test -w $publishSite && publish
   }

runSpecs() {
   cd $projectHome
   echo "Specifications:"
   npm test
   echo
   }

setupTools
copyGraphics
publishWebFiles
runSpecs
