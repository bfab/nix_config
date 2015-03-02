#!/bin/bash

set -e
set -x

pushd ~
git archive --remote=git@stash:fbox/pt-dotfiles.git master | tar -x
popd

