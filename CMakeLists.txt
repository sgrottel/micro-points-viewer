#
# Micro Points Viewer
# https://github.com/sgrottel/micro-points-viewer
#
cmake_minimum_required(VERSION 3.10)

#
project(MyPtsViewer VERSION 0.1.1)

# cpp17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# define DEBUG on all platforms for debug builds
add_compile_options("$<$<CONFIG:DEBUG>:-DDEBUG>")

# common core library
add_subdirectory(core)
# app -- CPU implementation
add_subdirectory(appcpu)
# app -- OpenGL implementation
add_subdirectory(appogl)

# tests
enable_testing()
add_subdirectory(coretest)
add_subdirectory(appcputest)
add_subdirectory(appogltest)

# installing extra files
install(FILES
	"README.md"
	"LICENSE"
	DESTINATION .
	)
