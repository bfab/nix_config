#!/bin/bash -e

# Usage: concat this file and a tgz archive into an executable file, e.g.
# (assuming this file is named "self_extraction.sh"):
# cat self_extraction.sh archive.tgz > script.sh ; chmod +x script.sh
#
# Then move the resulting file where you want it to be extracted, and run it:
# it will unpack the original tgz archive in the "unpacked" subfolder of the executable's path.

set -e

DESTINATION_FOLDER="$(dirname $0)/unpacked"
TEMPORARY_ARCHIVE="$DESTINATION_FOLDER/temp.tgz"

# size of the executable script, to be stripped in order to obtain its payload
# make sure to change this whenever the unpacking script is changed
UNPACKER_SIZE=1206

# exiting if the target folder already exists
if [ -d "$DESTINATION_FOLDER" ]; then
    echo "$DESTINATION_FOLDER already exists. Please delete or move it and retry."
    exit 1
fi

echo "Extracting in $DESTINATION_FOLDER"

mkdir "$DESTINATION_FOLDER"

# saving the bundled archive in a separate file; 
dd bs=$UNPACKER_SIZE skip=1 if="$0" of="$TEMPORARY_ARCHIVE"

# extracting the archive

tar xzvf "$TEMPORARY_ARCHIVE" -C "$DESTINATION_FOLDER"

# deleting the archive
rm -f "$TEMPORARY_ARCHIVE"

echo "Extraction successfully complete."

exit 0
