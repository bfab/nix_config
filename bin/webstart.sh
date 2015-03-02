#!/bin/bash

DOMAIN=$(sed -E 's|(https?://)?([^/:]*).*|\2|' <<< $1)
JNLP_URL="https://$DOMAIN:3280/webstart/palantir.jnlp?memory=CUSTOM&memcustom=256-1024"

PATH_TO_THIS_SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
COMMAND="dl.sh"

"$PATH_TO_THIS_SCRIPT/$COMMAND" "$JNLP_URL" "$HOME/Downloads/webstarts" open
