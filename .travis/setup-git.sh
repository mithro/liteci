#!/bin/bash

set -x
set -e

git fetch --unshallow || true
git fetch --tags
git describe
