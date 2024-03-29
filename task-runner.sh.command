#!/bin/bash
##################################
# Snappy Food                    #
# Update files for FTP to server #
##################################

banner="Snappy Food"
projectHome=$(cd $(dirname $0); pwd)
pkgInstallHome=$(dirname $(dirname $(which httpd)))
apacheCfg=$pkgInstallHome/etc/httpd
apacheLog=$pkgInstallHome/var/log/httpd/error_log
webDocRoot=$(grep ^DocumentRoot $apacheCfg/httpd.conf | awk -F'"' '{ print $2 }')

setupTools() {
   cd $projectHome
   echo
   echo $banner
   echo $(echo $banner | sed s/./=/g)
   pwd
   test -d .git || { echo "Project must be in a git repository."; exit; }
   git restore dist/* &>/dev/null
   git pull --ff-only
   echo
   echo "Node.js:"
   which node || { echo "Need to install Node.js: https://nodejs.org"; exit; }
   node --version
   npm install --no-fund
   npm update --no-fund
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
   publishSite=$webDocRoot/centerkey.com
   publish() {
      echo "Publishing:"
      echo $publishSite
      cp -R websites/www.* $publishSite
      ls -o $publishSite | grep snappyfood
      ls -o $publishSite | grep dragonsgrill
      open http://localhost/centerkey.com/www.snappyfood.org
      open http://localhost/centerkey.com/www.dragonsgrill.org
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
