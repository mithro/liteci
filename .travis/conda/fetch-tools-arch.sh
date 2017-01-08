#!/bin/bash

ARCH="$1"

set -e
set -x

echo ""
echo "Install modules from conda for ${ARCH}"
echo "---------------------------"

conda install binutils-${ARCH}-elf
conda install gcc-${ARCH}-elf
conda install gdb-${ARCH}-elf
