add_custom_command( TARGET IneryClang POST_BUILD COMMAND mkdir -p ${CMAKE_BINARY_DIR}/bin )
macro( inery_clang_install file )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/inery_llvm/bin)
   add_custom_command( TARGET IneryClang POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CDT_INSTALL_PREFIX}/bin
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
endmacro( inery_clang_install )

macro( inery_clang_install_and_symlink file symlink )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/inery_llvm/bin)
   add_custom_command( TARGET IneryClang POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   add_custom_command( TARGET IneryClang POST_BUILD COMMAND cd ${CMAKE_BINARY_DIR}/bin && ln -sf ${file} ${symlink} )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CDT_INSTALL_PREFIX}/bin
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
   install(CODE "execute_process( COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_INSTALL_PREFIX}/bin)")
   install(CODE "execute_process( COMMAND ${CMAKE_COMMAND} -E create_symlink ${CDT_INSTALL_PREFIX}/bin/${file} ${CMAKE_INSTALL_PREFIX}/bin/${symlink})")
endmacro( inery_clang_install_and_symlink )

macro( inery_tool_install file )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/tools/bin)
   add_custom_command( TARGET IneryTools POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CDT_INSTALL_PREFIX}/bin
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
endmacro( inery_tool_install )

macro( inery_tool_install_and_symlink file symlink )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/tools/bin)
   add_custom_command( TARGET IneryTools POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CDT_INSTALL_PREFIX}/bin
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
   install(CODE "execute_process( COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_INSTALL_PREFIX}/bin)")
   install(CODE "execute_process( COMMAND ${CMAKE_COMMAND} -E create_symlink ${CDT_INSTALL_PREFIX}/bin/${file} ${CMAKE_INSTALL_PREFIX}/bin/${symlink})")
endmacro( inery_tool_install_and_symlink )

macro( inery_cmake_install_and_symlink file symlink )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/modules)
   install(CODE "execute_process( COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_INSTALL_PREFIX}/lib/cmake/inery.cdt)")
   install(CODE "execute_process( COMMAND ${CMAKE_COMMAND} -E create_symlink ${CDT_INSTALL_PREFIX}/lib/cmake/inery.cdt/${file} ${CMAKE_INSTALL_PREFIX}/lib/cmake/inery.cdt/${symlink})")
endmacro( inery_cmake_install_and_symlink )

macro( inery_libraries_install)
   execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/lib)
   execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/include)
   install(DIRECTORY ${CMAKE_BINARY_DIR}/lib/ DESTINATION ${CDT_INSTALL_PREFIX}/lib)
   install(DIRECTORY ${CMAKE_BINARY_DIR}/include/ DESTINATION ${CDT_INSTALL_PREFIX}/include)
endmacro( inery_libraries_install )

inery_clang_install_and_symlink(llvm-ranlib inery-ranlib)
inery_clang_install_and_symlink(llvm-ar inery-ar)
inery_clang_install_and_symlink(llvm-nm inery-nm)
inery_clang_install_and_symlink(llvm-objcopy inery-objcopy)
inery_clang_install_and_symlink(llvm-objdump inery-objdump)
inery_clang_install_and_symlink(llvm-readobj inery-readobj)
inery_clang_install_and_symlink(llvm-readelf inery-readelf)
inery_clang_install_and_symlink(llvm-strip inery-strip)

inery_clang_install(opt)
inery_clang_install(llc)
inery_clang_install(lld)
inery_clang_install(ld.lld)
inery_clang_install(ld64.lld)
inery_clang_install(clang-7)
inery_clang_install(wasm-ld)

inery_tool_install_and_symlink(inery-pp inery-pp)
inery_tool_install_and_symlink(inery-wast2wasm inery-wast2wasm)
inery_tool_install_and_symlink(inery-wasm2wast inery-wasm2wast)
inery_tool_install_and_symlink(inery-cc inery-cc)
inery_tool_install_and_symlink(inery-cpp inery-cpp)
inery_tool_install_and_symlink(inery-ld inery-ld)
inery_tool_install_and_symlink(inery-abigen inery-abigen)
inery_tool_install_and_symlink(inery-abidiff inery-abidiff)
inery_tool_install_and_symlink(inery-init inery-init)

inery_clang_install(../lib/LLVMIneryApply${CMAKE_SHARED_LIBRARY_SUFFIX})
inery_clang_install(../lib/LLVMInerySoftfloat${CMAKE_SHARED_LIBRARY_SUFFIX})
inery_clang_install(../lib/inery_plugin${CMAKE_SHARED_LIBRARY_SUFFIX})

inery_cmake_install_and_symlink(inery.cdt-config.cmake inery.cdt-config.cmake)
inery_cmake_install_and_symlink(IneryWasmToolchain.cmake IneryWasmToolchain.cmake)
inery_cmake_install_and_symlink(IneryCDTMacros.cmake IneryCDTMacros.cmake)

inery_libraries_install()
