#!/bin/bash
set -e

# Create a build directory
mkdir -p /mumble/repo/build
cd /mumble/repo/build

# Configure and build
cmake .. -DCMAKE_BUILD_TYPE=Release $MUMBLE_CMAKE_ARGS
make -j$(nproc)
