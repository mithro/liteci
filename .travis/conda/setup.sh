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

if [ $SOURCED = 1 ]; then
	echo "You must run this script, rather then try to source it."
	echo "$SCRIPT_SRC"
	return
fi

set -e

source $TRAVIS_DIR/settings.sh

echo ""
echo "Install modules from conda"
echo "---------------------------"
CONDA_DIR=$PWD/build/conda
export PATH=$CONDA_DIR/bin:$PATH
(
        if [ ! -d $CONDA_DIR ]; then
		(
			cd $BUILD_DIR
	                wget -c https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
	                chmod a+x Miniconda3-latest-Linux-x86_64.sh
	                ./Miniconda3-latest-Linux-x86_64.sh -p $CONDA_DIR -b
	                conda config --set always_yes yes --set changeps1 no
	                conda update -q conda
		)
        fi
        conda config --add channels timvideos
)

ln -sf \
	$TRAVIS_DIR/conda/fetch-tools-arch.sh \
	$CONDA_DIR/bin/fetch-tools-arch

for ARCH in $ARCHS; do
	fetch-tools-arch $ARCH
done

echo "export PATH=$CONDA_DIR/bin:$PATH"
