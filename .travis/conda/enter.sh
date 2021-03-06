#!/bin/bash

if [ "`whoami`" = "root" ]
then
    echo "Running the script as root is not permitted"
    exit 1
fi

CALLED=$_
[[ "${BASH_SOURCE[0]}" != "${0}" ]] && SOURCED=1 || SOURCED=0

SCRIPT_SRC=$(realpath ${BASH_SOURCE[0]})
SCRIPT_DIR=$(dirname $SCRIPT_SRC)

TRAVIS_DIR=$(realpath $SCRIPT_DIR/..)
TOP_DIR=$(realpath $TRAVIS_DIR/..)

if [ $SOURCED = 0 ]; then
	echo "You must source this script, rather then try to run it."
	echo "$SCRIPT_SRC"
	exit 1
fi

source $TRAVIS_DIR/settings.sh

echo ""
echo "Checking modules from conda"
echo "---------------------------"
CONDA_DIR=$PWD/build/conda
export PATH=$CONDA_DIR/bin:$PATH
for ARCH in $ARCHS; do

	check-tools-arch $ARCH || return 1
done

alias python=python3
