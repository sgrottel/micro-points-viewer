﻿// micro-points-viewer-cmake.cpp : Defines the entry point for the application.
//

#include <iostream>


int main()
{
	std::cout << "Hello\n";
#if (defined(DEBUG) || defined(_DEBUG)) && !defined(NDEBUG)
	std::cout << "I am a Debug build.\n";
#else
	std::cout << "I am a Release build.\n";
#endif
	std::cout << "I am " << 8 * sizeof(void*) << " bit wide.\n";

	std::cout << std::endl;
	return 0;
}
