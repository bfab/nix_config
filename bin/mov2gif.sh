#!/bin/bash

[ $# -eq 1 ] && [ -r "$1" ] || {
	echo "Need a mov file as first argument."
	exit 1
}

MOV_FILE="$1"

MOV_DIRNAME=$(dirname "$MOV_FILE")
MOV_BASENAME=$(basename "$MOV_FILE")
MOV_BASENAME_NOEXT=$(echo "$MOV_BASENAME" | sed 's|\(.*\)\.[^.]*|\1|')
TARGET_FILE="$MOV_DIRNAME/${MOV_BASENAME_NOEXT}.gif"

TMP_PNG_FOLDER="/tmp/temp_pngs"
TMP_GIF_FOLDER="/tmp/temp_gifs"

mkdir -p "$TMP_PNG_FOLDER"
mkdir -p "$TMP_GIF_FOLDER"

ffmpeg -i "$MOV_FILE" -r 10 "$TMP_PNG_FOLDER/out%05d.png" &&
sips -s format gif $TMP_PNG_FOLDER/*.png --out "$TMP_GIF_FOLDER" &&
gifsicle --optimize=3 --delay=10 --loopcount $TMP_GIF_FOLDER/*.gif > "$TARGET_FILE" &&

rm -rf "$TMP_PNG_FOLDER"
rm -rf "$TMP_GIF_FOLDER"
