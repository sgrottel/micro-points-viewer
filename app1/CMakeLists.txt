# CMakeList.txt : application #1 demo
#
cmake_minimum_required (VERSION 3.8)

# Add source to this project's executable.
add_executable (mpvdemo "micro-points-viewer-demo.cpp" )
target_link_libraries(mpvdemo PUBLIC baselib)
