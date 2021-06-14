#
# Micro Points Viewer -- Core
#
cmake_minimum_required(VERSION 3.10)

add_library(MyPtrsViewCore core.cpp "include/mpvcore/core.h")
target_include_directories(MyPtrsViewCore PUBLIC
	"${PROJECT_SOURCE_DIR}/core/include"
	)

