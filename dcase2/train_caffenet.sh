#!/usr/bin/env sh
set -e

./build/tools/caffe train \
    --solver=examples/dcase2/solver.prototxt $@
