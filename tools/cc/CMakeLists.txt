configure_file(${CMAKE_CURRENT_SOURCE_DIR}/inery-cc.cpp.in ${CMAKE_BINARY_DIR}/inery-cc.cpp)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/inery-cpp.cpp.in ${CMAKE_BINARY_DIR}/inery-cpp.cpp)

add_tool(inery-cc)
add_tool(inery-cpp)
