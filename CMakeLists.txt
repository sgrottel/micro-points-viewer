# CMakeList.txt : CMake project for micro-points-viewer-cmake, include source and define
# project specific logic here.
#
cmake_minimum_required (VERSION 3.8)

project("mpvdemo")

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

add_compile_options("$<$<CONFIG:DEBUG>:-DDEBUG>")

add_subdirectory(baselib)

add_subdirectory(app1)

# TODO: Add tests and install targets if needed.
