# CMakeList.txt : base library
#
cmake_minimum_required(VERSION 3.13 FATAL_ERROR)

add_library(baselib STATIC "lib_demo.cpp" "include/base/lib_demo.h")
target_include_directories(baselib PUBLIC "${PROJECT_SOURCE_DIR}/baselib/include")

require_external(glm)
target_link_libraries(baselib PUBLIC glm)
