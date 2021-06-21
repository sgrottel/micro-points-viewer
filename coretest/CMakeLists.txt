#
# Micro Points Viewer -- CoreTest
#
cmake_minimum_required(VERSION 3.10)

add_executable(myPtsViewerCoreTestRunner testmain.cpp)

target_link_libraries(myPtsViewerCoreTestRunner PUBLIC MyPtrsViewCore)
target_link_libraries(myPtsViewerCoreTestRunner PRIVATE glm::glm)

add_test(myPtsViewerCoreTestRunner myPtsViewerCoreTestRunner)
