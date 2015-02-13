#!/bin/bash

set -e

FILE_URL="$1"
TARGET_FOLDER="$2"
OPTIONAL_CMD="$3"

DOMAIN=$(echo "$FILE_URL" | sed -e 's|.*://\(.*\):.*|\1|')
FILE_BASENAME=$(echo "$FILE_URL" | sed 's|.*/\(.*\)?.*|\1|')
FILE_NOEXT=$(echo "$FILE_BASENAME" | sed 's|\(.*\)\..*|\1|')
EXTENSION=$(echo "$FILE_BASENAME" | sed 's|.*\.\(.*\)|\1|')
TARGET="$TARGET_FOLDER/${FILE_NOEXT}_${DOMAIN}.$EXTENSION"

wget --no-check-certificate -O "$TARGET" "$FILE_URL"

if [ -n "$OPTIONAL_CMD" ] ;then
  "$OPTIONAL_CMD" "$TARGET"
fi
