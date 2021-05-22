#!/bin/bash

# Enable pattern matching
shopt -s extglob

script_name=`basename "$0"`

# Remove all top level directories other than llvm
rm -rf !($script_name|"gcc_10_changes.patch"|"prepare_changes.patch"|"llvm"|"README.md")

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

# Remove not necessary llvm targets
rm -rf llvm/lib/Target/AMDGPU
rm -rf llvm/lib/Target/ARC
rm -rf llvm/lib/Target/ARM
rm -rf llvm/lib/Target/AVR
rm -rf llvm/lib/Target/BPF
rm -rf llvm/lib/Target/CSKY
rm -rf llvm/lib/Target/Hexagon
rm -rf llvm/lib/Target/Lanai
rm -rf llvm/lib/Target/Mips
rm -rf llvm/lib/Target/MSP430
rm -rf llvm/lib/Target/NVPTX
rm -rf llvm/lib/Target/PowerPC
rm -rf llvm/lib/Target/RISCV
rm -rf llvm/lib/Target/Sparc
rm -rf llvm/lib/Target/SystemZ
rm -rf llvm/lib/Target/VE
rm -rf llvm/lib/Target/WebAssembly
rm -rf llvm/lib/Target/XCore

