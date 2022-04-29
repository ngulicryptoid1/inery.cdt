# Install script for directory: /home/dusan/Desktop/inery.cdt.1.7.x/inery_llvm/unittests

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
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/ADT/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/Analysis/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/AsmParser/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/BinaryFormat/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/Bitcode/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/CodeGen/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/DebugInfo/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/Demangle/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/ExecutionEngine/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/FuzzMutate/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/IR/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/LineEditor/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/Linker/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/MC/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/MI/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/Object/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/ObjectYAML/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/Option/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/Passes/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/ProfileData/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/Support/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/Target/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/Transforms/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/XRay/cmake_install.cmake")
  include("/home/dusan/Desktop/inery.cdt.1.7.x/build/inery_llvm/unittests/tools/cmake_install.cmake")

endif()

