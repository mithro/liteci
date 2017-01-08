#! /bin/bash

set -e
set -x

echo ""
echo "Install modules from conda"
echo "---------------------------"
CONDA_DIR=$PWD/build/conda
export PATH=$CONDA_DIR/bin:$PATH
(
        if [ ! -d $CONDA_DIR ]; then
                wget -c https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
                chmod a+x Miniconda3-latest-Linux-x86_64.sh
                ./Miniconda3-latest-Linux-x86_64.sh -p $CONDA_DIR -b
                conda config --set always_yes yes --set changeps1 no
                conda update -q conda
        fi
        conda config --add channels timvideos
)
