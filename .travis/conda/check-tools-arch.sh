#!/bin/bash

ARCH="$1"

set -e

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

if [ $SOURCED = 1 ]; then
	echo "You must run this script, rather then try to source it."
	echo "$SCRIPT_SRC"
	return
fi

source $TRAVIS_DIR/settings.sh
source $TRAVIS_DIR/shell/check.sh

check_version ${ARCH}-elf-ld ${BINUTILS_VERSION}
check_version ${ARCH}-elf-gcc ${GCC_VERSION}
#check_version ${ARCH}-elf-gdb ${GDB_VERSION}
