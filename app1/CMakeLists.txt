# CMakeList.txt : application #1 demo
#
cmake_minimum_required (VERSION 3.8)

add_executable(mpvdemo
	"mpvdemo.cpp"
	)

require_external(glfw)

find_package(OpenGL REQUIRED)

target_include_directories(mpvdemo PRIVATE ${OPENGL_INCLUDE_DIRS})

target_link_libraries(mpvdemo PRIVATE
	baselib
	${OPENGL_LIBRARIES}
	glfw
	)
