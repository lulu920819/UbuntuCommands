#!/usr/bin/env sh
set -e

./build/tools/caffe train \
    --solver=examples/dcase3/solver.prototxt $@
