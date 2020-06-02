#! /usr/bin/env bash

rm -rf build*
meson setup build-gcc

cd build-gcc
ninja -j4