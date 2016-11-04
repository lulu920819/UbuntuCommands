#!/usr/bin/env sh
set -e

./build/tools/caffe train \
    --solver=examples/dcase1/solver.prototxt $@
