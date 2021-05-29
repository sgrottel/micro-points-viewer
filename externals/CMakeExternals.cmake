# Requires git to fetch depencies in source
find_package(Git REQUIRED)

# Clone external script
if(NOT EXISTS "${CMAKE_BINARY_DIR}/script-externals")
	message(STATUS "Downloading external scripts")
	execute_process(COMMAND
		${GIT_EXECUTABLE} clone -b v2.3 https://github.com/sgrottel/megamol-cmake-externals.git script-externals --depth 1
		WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
		ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE)
endif()

# Include external script
include("${CMAKE_BINARY_DIR}/script-externals/cmake/External.cmake")

#
# Centralized function to require externals to add them once by invoking
# require_external(<EXTERNAL_TARGET>).
#
# Think of this function as a big switch, testing for the name and presence
# of the external target to guard against duplicated targets.
#
function(require_external NAME)
	set(FETCHCONTENT_QUIET ON CACHE BOOL "")

	# Header-only libraries #####################################################

	# glm
	if(NAME STREQUAL "glm")
		if(TARGET glm)
			return()
		endif()

		add_external_headeronly_project(glm
			GIT_REPOSITORY https://github.com/sgrottel/glm.git
			GIT_TAG "0.9.9.8")

	# Built libraries #####################################################

	# glfw
	elseif(NAME STREQUAL "glfw")
		if(TARGET glfw)
			return()
		endif()

		include(GNUInstallDirs)

		if (WIN32)
			set(GLFW_LIB "${CMAKE_INSTALL_LIBDIR}/glfw3.lib")
		else ()
			set(GLFW_LIB "${CMAKE_INSTALL_LIBDIR}/libglfw3.a")
		endif ()

		add_external_project(glfw STATIC
			GIT_REPOSITORY https://github.com/sgrottel/glfw.git
			GIT_TAG "3.3.4"
			BUILD_BYPRODUCTS "<INSTALL_DIR>/${GLFW_LIB}"
			CMAKE_ARGS
				-DBUILD_SHARED_LIBS=OFF
				-DGLFW_BUILD_DOCS=OFF
				-DGLFW_BUILD_EXAMPLES=OFF
				-DGLFW_BUILD_TESTS=OFF)

		add_external_library(glfw
			PROJECT glfw
			LIBRARY ${GLFW_LIB})

	# imgui
	elseif(NAME STREQUAL "imgui")
		if(TARGET imgui)
			return()
		endif()

		require_external(glfw)
		external_get_property(glfw INSTALL_DIR)

		if(WIN32)
			set(IMGUI_LIB "lib/imgui.lib")
		else()
			set(IMGUI_LIB "lib/libimgui.a")
		endif()

		add_external_project(imgui STATIC
			GIT_REPOSITORY https://github.com/ocornut/imgui.git
			GIT_TAG 085cff2fe58077a4a0bf1f9e9284814769141801 # docking branch > version "1.82"
			BUILD_BYPRODUCTS "<INSTALL_DIR>/${IMGUI_LIB}"
			PATCH_COMMAND ${CMAKE_COMMAND} -E copy
				"${CMAKE_SOURCE_DIR}/externals/imgui/CMakeLists.txt"
				"<SOURCE_DIR>/CMakeLists.txt"
			DEPENDS
				glfw
			CMAKE_ARGS
				-DGLAD_INCLUDE_DIR:PATH=${CMAKE_SOURCE_DIR}/externals/glad/include
				-DGLFW_INCLUDE_DIR:PATH=${INSTALL_DIR}/include)

		add_external_library(imgui
			LIBRARY ${IMGUI_LIB})

	#######################################################################

	else()
		message(FATAL_ERROR "Unknown external required \"${NAME}\"")
	endif()

	mark_as_advanced(FORCE FETCHCONTENT_BASE_DIR)
	mark_as_advanced(FORCE FETCHCONTENT_FULLY_DISCONNECTED)
	mark_as_advanced(FORCE FETCHCONTENT_QUIET)
	mark_as_advanced(FORCE FETCHCONTENT_UPDATES_DISCONNECTED)
endfunction(require_external)
