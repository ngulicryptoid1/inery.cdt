# Install script for directory: /home/dusan/Desktop/inery.cdt.1.7.x/inery_llvm/lib

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local/llvm")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/IR/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/FuzzMutate/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/IRReader/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/CodeGen/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/BinaryFormat/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/Bitcode/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/Transforms/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/Linker/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/Analysis/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/LTO/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/MC/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/Object/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/ObjectYAML/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/Option/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/DebugInfo/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/ExecutionEngine/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/Target/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/AsmParser/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/LineEditor/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/ProfileData/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/Passes/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/ToolDrivers/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/XRay/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/Testing/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/lib/WindowsManifest/cmake_install.cmake")

endif()

