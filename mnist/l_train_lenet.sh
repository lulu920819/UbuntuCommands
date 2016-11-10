#!/usr/bin/env sh
set -e

./build/tools/caffe train --solver=examples/dcase_mnist/l_lenet_solver.prototxt $@
