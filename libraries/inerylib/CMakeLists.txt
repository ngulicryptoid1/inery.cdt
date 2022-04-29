file(GLOB HEADERS "*.hpp"
                  "*.h")

add_library(inery
            inerylib.cpp
            crypto.cpp
            ${HEADERS})

add_library(inery_malloc
            malloc.cpp
            ${HEADERS})

add_library(inery_dsm
            simple_malloc.cpp
            ${HEADERS})

add_library(inery_cmem
            memory.cpp
            ${HEADERS})

add_native_library(native_inery
                   inerylib.cpp
                   crypto.cpp
                   malloc.cpp
                   ${HEADERS})

set_target_properties(inery_malloc PROPERTIES LINKER_LANGUAGE C)

target_include_directories(inery PUBLIC
                                 ${CMAKE_SOURCE_DIR}/libc/musl/include
                                 ${CMAKE_SOURCE_DIR}/libc/musl/src/internal
                                 ${CMAKE_SOURCE_DIR}/libc/musl/src/crypt
                                 ${CMAKE_SOURCE_DIR}/libc/musl/arch/ine
                                 ${CMAKE_SOURCE_DIR}/libcxx/include
                                 ${CMAKE_SOURCE_DIR}
                                 ${CMAKE_SOURCE_DIR}/boost/include)

target_link_libraries( inery c c++ )
add_dependencies( native_inery inery )

add_custom_command( TARGET inery POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:inery> ${BASE_BINARY_DIR}/lib )
add_custom_command( TARGET inery_malloc POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:inery_malloc> ${BASE_BINARY_DIR}/lib )
add_custom_command( TARGET inery_dsm POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:inery_dsm> ${BASE_BINARY_DIR}/lib )
add_custom_command( TARGET inery_cmem POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:inery_cmem> ${BASE_BINARY_DIR}/lib )
add_custom_command( TARGET native_inery POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:native_inery> ${BASE_BINARY_DIR}/lib )

file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/../inerylib DESTINATION ${BASE_BINARY_DIR}/include FILES_MATCHING PATTERN "*.h" PATTERN "*.hpp")
