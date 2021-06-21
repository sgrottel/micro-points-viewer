#
# Micro Points Viewer -- Core
#
cmake_minimum_required(VERSION 3.10)

add_library(MyPtrsViewCore STATIC core.cpp "include/mpvcore/core.h")

find_package(glm CONFIG REQUIRED)
target_link_libraries(MyPtrsViewCore PRIVATE glm::glm)

target_include_directories(MyPtrsViewCore PUBLIC
	"${PROJECT_SOURCE_DIR}/core/include"
	)
