# This file allows users to call find_package(Clang) and pick up our targets.



find_package(LLVM REQUIRED CONFIG
             HINTS "/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/cmake/llvm")

set(CLANG_EXPORTED_TARGETS "clangBasic;clangLex;clangParse;clangAST;clangDynamicASTMatchers;clangASTMatchers;clangCrossTU;clangSema;clangCodeGen;clangAnalysis;clangEdit;clangRewrite;clangARCMigrate;clangDriver;clangSerialization;clangRewriteFrontend;clangFrontend;clangFrontendTool;clangToolingCore;clangToolingInclusions;clangToolingRefactor;clangToolingASTDiff;clangTooling;clangIndex;clangStaticAnalyzerCore;clangStaticAnalyzerCheckers;clangStaticAnalyzerFrontend;clangFormat;clang;clang-format;clangHandleCXX;clang-import-test;clang-rename;clang-refactor;libclang")
set(CLANG_CMAKE_DIR "/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/cmake/clang")
set(CLANG_INCLUDE_DIRS "/home/dusan/Desktop/inery.cdt.1.7.x/inery_llvm/tools/clang/include;/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/tools/clang/include")

# Provide all our library targets to users.
include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/cmake/clang/ClangTargets.cmake")

# By creating clang-tablegen-targets here, subprojects that depend on Clang's
# tablegen-generated headers can always depend on this target whether building
# in-tree with Clang or not.
if(NOT TARGET clang-tablegen-targets)
  add_custom_target(clang-tablegen-targets)
endif()
