#!/bin/bash

set -e

[ `id -u` == 0 ] || { echo "Must run as root" ; exit 1; }

yum install -y pcre-devel
yum install -y xz-devel
yum install -y git
yum install -y gcc
yum install -y automake

pushd /usr/local/src
git clone https://github.com/ggreer/the_silver_searcher.git
pushd the_silver_searcher
./build.sh
make install
popd
popd

which ag >/dev/null && echo "Installed." || echo "Something went wrong; not installed."
