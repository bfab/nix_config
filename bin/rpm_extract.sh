#!/bin/bash

RPM_FILE=$1

[ $1 ] && [ -r $1 ] || { echo "pass either a list of rpms or a directory." ; exit 1; }

extract() {
	local RPM_FILE=$1
	local TARGET_DIR=$2

	local TMP_RPM_FILE=
	if [ $TARGET_DIR ] ; then
		mkdir -p $TARGET_DIR
	else
		TARGET_DIR=.
	fi

	local TMP_RPM_BASENAME=$$.tmp.rpm
	cp $RPM_FILE $TARGET_DIR/$TMP_RPM_BASENAME
	pushd $TARGET_DIR
		rpm2cpio.pl $TMP_RPM_BASENAME | cpio -idmv
		rm $TMP_RPM_BASENAME
	popd
}

if [ -d $1 ] ; then
	for FILE in $1/*.rpm ; do
		extract $FILE ${FILE}.dir
	done
elif [ $2 ] ; then
	for FILE in $@ ;do
		extract $FILE ${FILE}.dir
	done
else
	extract $1 $1.dir
fi
