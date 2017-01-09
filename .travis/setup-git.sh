#!/bin/bash

set -x
set -e

git fetch --unshallow || true
git fetch --tags

git submodule update --recursive --init
git submodule foreach git submodule update --recursive --init

git describe
