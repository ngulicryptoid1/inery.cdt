cmake_minimum_required(VERSION 3.5)

# Sanity check our source directory to make sure that we are not trying to
# generate an in-source build, and to make
# sure that we don't have any stray generated files lying around in the tree
if( CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_CURRENT_BINARY_DIR)
  message(FATAL_ERROR "In-source builds are not allowed.
Please create a directory and run cmake from there, passing the path
to this source directory as the last argument.
This process created the file `CMakeCache.txt' and the directory `CMakeFiles'.
Please delete them.")
endif()

project(inery_cdt)

find_program(SCCACHE_FOUND sccache)
if (SCCACHE_FOUND)
   message(STATUS "Using sccache")
   set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE sccache)
else()
   find_program(CCACHE_FOUND ccache)
   if (CCACHE_FOUND)
      message(STATUS "Using ccache")
      set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
   endif()
endif()


set(VERSION_MAJOR 1)
set(VERSION_MINOR 7)
set(VERSION_PATCH 0)
#set(VERSION_SUFFIX rc1)

if (VERSION_SUFFIX)
   set(VERSION_FULL "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}-${VERSION_SUFFIX}")
else()
   set(VERSION_FULL "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}")
endif()

set(CDT_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX}/inery.cdt)

include(GNUInstallDirs)

include(modules/ClangExternalProject.txt)
include(modules/ToolsExternalProject.txt)

set(WASM_SDK_BUILD true)

### Configure the IneryWasmToolchain.cmakes
set(CDT_ROOT_DIR ${CMAKE_BINARY_DIR})

configure_file(${CMAKE_SOURCE_DIR}/modules/inery.cdt-config.cmake ${CMAKE_BINARY_DIR}/lib/cmake/inery.cdt/inery.cdt-config.cmake @ONLY)
configure_file(${CMAKE_SOURCE_DIR}/modules/IneryCDTMacros.cmake.in ${CMAKE_BINARY_DIR}/lib/cmake/inery.cdt/IneryCDTMacros.cmake @ONLY)
configure_file(${CMAKE_SOURCE_DIR}/modules/IneryWasmToolchain.cmake.in ${CMAKE_BINARY_DIR}/lib/cmake/inery.cdt/IneryWasmToolchain.cmake @ONLY)

set(CDT_ROOT_DIR ${CDT_INSTALL_PREFIX})

configure_file(${CMAKE_SOURCE_DIR}/modules/inery.cdt-config.cmake ${CMAKE_BINARY_DIR}/modules/inery.cdt-config.cmake @ONLY)
configure_file(${CMAKE_SOURCE_DIR}/modules/IneryCDTMacros.cmake.in ${CMAKE_BINARY_DIR}/modules/IneryCDTMacros.cmake @ONLY)
configure_file(${CMAKE_SOURCE_DIR}/modules/IneryWasmToolchain.cmake.in ${CMAKE_BINARY_DIR}/modules/IneryWasmToolchain.cmake @ONLY)
install(FILES ${CMAKE_BINARY_DIR}/modules/IneryCDTMacros.cmake DESTINATION ${CDT_INSTALL_PREFIX}/lib/cmake/inery.cdt)

set(CDT_ROOT_DIR "_PREFIX_")
configure_file(${CMAKE_SOURCE_DIR}/modules/IneryCDTMacros.cmake.in ${CMAKE_BINARY_DIR}/modules/IneryCDTMacrosPackage.cmake @ONLY)
configure_file(${CMAKE_SOURCE_DIR}/modules/IneryWasmToolchain.cmake.in ${CMAKE_BINARY_DIR}/modules/IneryWasmToolchainPackage.cmake @ONLY)
configure_file(${CMAKE_SOURCE_DIR}/modules/inery.cdt-config.cmake ${CMAKE_BINARY_DIR}/modules/inery.cdt-config.cmake.package @ONLY)

include(modules/LibrariesExternalProject.txt)

include(modules/InstallCDT.cmake)

configure_file(${CMAKE_SOURCE_DIR}/imports/inery.imports.in ${CMAKE_BINARY_DIR}/inery.imports COPYONLY)
install(FILES ${CMAKE_BINARY_DIR}/inery.imports DESTINATION ${CDT_INSTALL_PREFIX})

configure_file(${CMAKE_SOURCE_DIR}/scripts/ricardine/ricardine.py ${CMAKE_BINARY_DIR}/scripts/ricardine.py COPYONLY)
install(FILES ${CMAKE_BINARY_DIR}/scripts/ricardine.py DESTINATION ${CDT_INSTALL_PREFIX}/scripts)

# section for package construction
set(VENDOR "block.one")
set(PROJECT_NAME "inery.cdt")
set(DESC "Toolchain and supporting tools for the INE.IO platform")
set(URL "https://github.com/inery/inery.cdt")
set(EMAIL "support@block.one")
configure_file(${CMAKE_SOURCE_DIR}/scripts/generate_package.sh.in ${CMAKE_BINARY_DIR}/packages/generate_package.sh @ONLY)
configure_file(${CMAKE_SOURCE_DIR}/scripts/generate_deb.sh ${CMAKE_BINARY_DIR}/packages/generate_deb.sh COPYONLY)
configure_file(${CMAKE_SOURCE_DIR}/scripts/generate_bottle.sh ${CMAKE_BINARY_DIR}/packages/generate_bottle.sh COPYONLY)
configure_file(${CMAKE_SOURCE_DIR}/scripts/generate_rpm.sh ${CMAKE_BINARY_DIR}/packages/generate_rpm.sh COPYONLY)
configure_file(${CMAKE_SOURCE_DIR}/scripts/generate_tarball.sh ${CMAKE_BINARY_DIR}/packages/generate_tarball.sh COPYONLY)
