#!/bin/bash

set -e
set -x

pushd ~/bin
git archive --remote=git@stash:fbox/zipped_file_editor.git master | tar -x
popd

