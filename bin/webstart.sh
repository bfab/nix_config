#!/bin/bash

DOMAIN=$(sed -E 's|(https?://)?([^/:]*).*|\2|' <<< $1)
JNLP_URL="https://$DOMAIN:3280/webstart/palantir.jnlp?memory=CUSTOM&memcustom=256-2048"
JNLP_LOCAL_FOLDER="$HOME/Downloads/webstarts"

PATH_TO_THIS_SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

[ -d  "$JNLP_LOCAL_FOLDER" ] || mkdir -p "$JNLP_LOCAL_FOLDER"

"$PATH_TO_THIS_SCRIPT/dl.sh" "$JNLP_URL" "$JNLP_LOCAL_FOLDER" open
