#!/bin/bash

set -ex

. .travis/conda/enter.sh

python setup.py test
python setup.py install
python setup.py pep8
