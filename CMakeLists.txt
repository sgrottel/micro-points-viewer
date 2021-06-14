#
# Micro Points Viewer
# https://github.com/sgrottel/micro-points-viewer
#
cmake_minimum_required(VERSION 3.10)

#
project(MyPtsViewer)

add_subdirectory(core)
add_subdirectory(appcpu)
add_subdirectory(appogl)

enable_testing()
add_subdirectory(coretest)
add_subdirectory(appcputest)
add_subdirectory(appogltest)
