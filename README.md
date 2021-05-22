Fork of llvm-project to bundle LLVM inside in ClickHouse.
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

Repository is stripped using prepare.sh script. Additional ClickHouse patch is prepare_changes.patch.
