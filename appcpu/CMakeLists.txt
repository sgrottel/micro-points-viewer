#
# Micro Points Viewer -- AppCPU
#
cmake_minimum_required(VERSION 3.10)

add_executable(myPtsViewerCPU main.cpp)

target_link_libraries(myPtsViewerCPU PUBLIC MyPtrsViewCore)

install(TARGETS myPtsViewerCPU DESTINATION bin)
