
#include "mpvcore/core.h"

int main() {

	int i = myCoreFunction();

	glm::vec3 v = myVec3FromCoreFunc();
	if (glm::abs(v.x - 1.0f) > 0.00001f) return 2;
	if (glm::abs(v.y - 2.0f) > 0.00001f) return 3;
	if (glm::abs(v.z - 3.0f) > 0.00001f) return 4;

	return (i == 12) ? 0 : 1;
}
