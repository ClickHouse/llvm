Allows to bundle LLVM inside ClickHouse repository.
This is intended for reproducible builds, that continue to work regardless to changes of compile options and ABI changes.

The usage of this repository is not necessarily.
Instead you can simply install packages
 libllvm9.0 liblld-9.0-dev libclang-9.0-dev
 from your Ubuntu repository and use them for build.

But when using packages from the system, a few downsides exist:
- it requires to use fresh enough version of Ubuntu for builds;
- the packages are usually outdated;
- the packages may lack static libraries;
- the packages may change in uncontrolled way and your build becomes irreproducible;
- different OS have their own combinations of packages - it's very difficult to follow;
- the packages was compiled with fixed compile flags and fixed ABI, you cannot change it;
- for example, you may want to rebuild packages with or without RTTI, with libc++ or libstdc++, with sanitizer, etc.

Downsides of bundled library:
- increased build time.

A brief sketch on how this repository was created:

clone https://github.com/llvm/llvm-project, tag llvmorg-9.0.0

leave only llvm

rm -rf llvm/{INPUTS,bindings,test,unittests,www,docs,examples,benchmarks,tools,runtimes,resources,projects,lib/Testing}

remove them from llvm/LLVMBuild.txt and llvm/lib/LLVMBuild.txt

remove llvm/lib/Target/ all but X86 AArch64

remove them from llvm/lib/Target/LLVMBuild.txt

In llvm/CMakeLists.txt change options according to -D LLVM_ENABLE_PROJECTS='' -D LLVM_TARGETS_TO_BUILD='Native' -D LLVM_ENABLE_BACKTRACES=0 -D LLVM_ENABLE_CRASH_OVERRIDES=0 -D LLVM_ENABLE_FFI=0 -D LLVM_ENABLE_TERMINFO=0 -D LLVM_ENABLE_LIBXML2=0 -D LLVM_ENABLE_LIBEDIT=0 -D LLVM_ENABLE_LIBPFM=0 -D LLVM_ENABLE_OCAMLDOC=0 -D LLVM_INCLUDE_UTILS=0 -D LLVM_BUILD_UTILS=0 -D LLVM_INCLUDE_RUNTIMES=0 -D LLVM_BUILD_RUNTIMES=0 -D LLVM_BUILD_RUNTIME=0 -D LLVM_BUILD_EXAMPLES=0 -D LLVM_INCLUDE_EXAMPLES=0 -D LLVM_BUILD_TOOLS=0 -D LLVM_INCLUDE_TOOLS=0 -D LLVM_BUILD_TESTS=0 -D LLVM_INCLUDE_TESTS=0 -D LLVM_INCLUDE_GO_TESTS=0 -D LLVM_INCLUDE_DOCS=0 -D LLVM_INCLUDE_BENCHMARKS=0 -D LLVM_ENABLE_ZLIB=0

In CMakeLists.txt remove add_subdirectory(projects)

Remove system_libs from llvm/lib/Support/CMakeLists.txt

