#
# Micro Points Viewer -- AppOGL
#
cmake_minimum_required(VERSION 3.10)

add_executable(myPtsViewerOGL main.cpp)

target_link_libraries(myPtsViewerOGL PUBLIC MyPtrsViewCore)
target_link_libraries(myPtsViewerOGL PRIVATE glm::glm)

install(TARGETS myPtsViewerOGL DESTINATION bin)
