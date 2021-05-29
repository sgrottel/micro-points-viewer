# CMakeList.txt : CMake project for micro-points-viewer-cmake, include source and define
# project specific logic here.
#
cmake_minimum_required(VERSION 3.13 FATAL_ERROR)

project("mpvdemo")

# cpp11
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# define DEBUG on all platforms for debug builds
add_compile_options("$<$<CONFIG:DEBUG>:-DDEBUG>")

# External
include("externals/CMakeExternals.cmake")

# common base library
add_subdirectory(baselib)

# app1
add_subdirectory(app1)

# TODO: Add tests and install targets if needed.
