# CMakeList.txt : application #1 demo
#
cmake_minimum_required (VERSION 3.8)

add_executable(mpvdemo
	"mpvdemo.cpp"
	)

find_package(OpenGL REQUIRED)
find_package(glfw3 3.3 REQUIRED)

target_include_directories(mpvdemo PRIVATE ${OPENGL_INCLUDE_DIRS})

target_link_libraries(mpvdemo PUBLIC
	baselib
	${OPENGL_LIBRARIES}
	glfw
	)
