#!/bin/bash

[ $1 ] && [ -r $1 ] || { echo "pass either a list of rpms or a directory." ; exit 1; }

list() {
	echo fff
	local RPM_FILE=$1
	local WITH_TITLE=$2

	if [ $WITH_TITLE ] ; then
		echo
		echo
		echo
		echo $WITH_TITLE
		echo
	fi

	rpm2cpio.pl $RPM_FILE | cpio -t
}

if [ -d $1 ] ; then
	for FILE in $1/*.rpm ; do
		list $FILE $FILE
	done
elif [ $2 ] ; then
	for FILE in $@ ;do
		list $FILE $FILE
	done
else
	list $1
fi
