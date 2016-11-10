#!/usr/bin/env sh
set -e

./build/tools/caffe train --solver=examples/dcase_mnist/ll_lenet_solver.prototxt $@
