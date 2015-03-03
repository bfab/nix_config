#!/bin/bash

append_generator_for() {
  local file=$1

  echo "echo generating $file ..." >> $TARGET_FILE
  echo >> $TARGET_FILE
  echo "sed 's|$BACKTICK_PLACEHOLDER|\\\`|g' >$file <<$DELIMITER" >> $TARGET_FILE
  cat $file | sed 's|\\|\\\\|g' | sed 's|\$|\\\$|g' | sed "s|\`|$BACKTICK_PLACEHOLDER|g" >> $TARGET_FILE
  echo $DELIMITER >> $TARGET_FILE
  echo >> $TARGET_FILE
  echo >> $TARGET_FILE
}

# deals with linux/osx differences 
if [ `uname` = "Darwin" ] ; then
  MIME_FLAG=I
  MD5_GENERATOR=md5
else
  MIME_FLAG=i
  MD5_GENERATOR=md5sum
fi

# defines/determines execution parameters
TARGET_FILE=$1
RANDOM_STRING=`date | $MD5_GENERATOR`
DELIMITER=END_OF_FILE_MARKER_$RANDOM_STRING
BACKTICK_PLACEHOLDER=BACKTICK_$RANDOM_STRING

#find all text files in working directory
TEXT_FILES=`ls -a | xargs file -$MIME_FLAG | sed -n 's|\(.*\): *text/.*|./\1|p'`



# target file generation

echo "#!/bin/bash" > $TARGET_FILE
echo >> $TARGET_FILE
echo >> $TARGET_FILE

# appends, to target file, generators for each file
for file in $TEXT_FILES ; do
	echo "appending generator for text file $file ..."
	append_generator_for $file
done

# appends, to target file, a message to the user
echo >> $TARGET_FILE
echo >> $TARGET_FILE
echo "echo" >> $TARGET_FILE
echo "echo ...done generating files. Please remove \$0 unless you want to generate them again." >> $TARGET_FILE



echo
echo "...done generating text files generator, as $TARGET_FILE ;"
echo "Now you can move it anywhere you want the text files to be regenerated, and call it from the folder in which you want files to be generated."

chmod +x $TARGET_FILE
