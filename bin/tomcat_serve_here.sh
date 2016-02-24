#!/bin/bash

which catalina >/dev/null || ( echo "catalina is not in PATH; exiting. Have you installed Tomcat?" && exit 1)

CATALINA_HOME=`catalina | grep CATALINA_HOME | grep -o "/.*"`
SYMLINK="$CATALINA_HOME/webapps/$(basename $(pwd))"
ln -s `pwd` $SYMLINK

catalina run

rm $SYMLINK
