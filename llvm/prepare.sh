#!/bin/bash

# Enable pattern matching
shopt -s extglob

script_name=`basename "$0"`

# Remove all top level directories other than llvm
rm -rf !($script_name|"llvm"|"README.md")

# Remove not necessary llvm parts
rm -rf llvm/benchmarks
rm -rf llvm/bindings
rm -rf llvm/docs
rm -rf llvm/examples
rm -rf llvm/projects
rm -rf llvm/resources
rm -rf llvm/test
rm -rf llvm/tools
rm -rf llvm/unittests
rm -rf llvm/utils

