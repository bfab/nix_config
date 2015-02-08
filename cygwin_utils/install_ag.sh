#!/bin/sh

set -e

cd /tmp
git clone https://github.com/ggreer/the_silver_searcher.git
cd the_silver_searcher && ./build.sh && make install
cd -
rm -rf /tmp/the_silver_searcher
which ag


