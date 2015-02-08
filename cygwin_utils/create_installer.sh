#!/bin/sh

PKG_INSTALLER=install_packages.bat

echo -n "setup-x86_64.exe -P " > $PKG_INSTALLER
cygcheck -c -d | sed -e "1,2d" -e 's/ .*$//' | awk 'NR==1{printf $1}{printf ",%s", $1}' >> $PKG_INSTALLER


