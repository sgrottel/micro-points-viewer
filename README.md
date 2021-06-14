# Micro Points Viewer
Super minimalistic 3d point data viewer.

With _point data_, I mean both, volumetric point data, e.g. from simulations, and point cloud data.
The _minimalistic_ aspect includes both, only providing core functionality, and avoiding clever data structures as much as possible.
This viewer is the base for further, more advanced variants.

[![Build status](https://ci.appveyor.com/api/projects/status/djy1g0x67pnag2qi?svg=true)](https://ci.appveyor.com/project/s_grottel/micro-points-viewer)

## Features

* Can load a _fixed (maximum) number_ of points from a simple input file format
* Points are _XYZ RGB_; no transparency.
    * An _object-space point/ball size_ can be configured.
    * Points are to be rendered as unlit, unshaded balls.
* Points can additionally be _selected_, temporarily changeing their color to a fixed selection color.
    * Selections are created by specifying a sphere _point_ and _radius_ to switch all points inside either to selected or unselected, iteratively.
* The point data is transformed by one configurable _model matrix_.
* There is one _clipping box_ definition, with
    * spatial _size_, and a _model matrix_, and
    * _configurations_ to hide points inside the box, outside the box, or to show all points
* There is only one perspective camera, _view_ and _projection matrices_ defined by:
    * _position_, _lookat_, and _up_ vectors,
    * _near clip_, _far clip_ distance hints, and
    * _field of view angle_.
* Interactive OpenGL 4.1 core window, based on _GLFW_, _glLoadGen_, _glm_
* Minimalistic UI based on _DearImGui_
* A _screenshot_ can be created at specified resolution (single FBO) and saved as PNG image file
* All features can be controlled via UI and _command line arguments_, allowing for batch processing.
    * Exception apply, e.g. loading data is only available via command line arguments.

## How to Build

TODO

## License

Copyright 2021 SGrottel (https://www.sgrottel.de)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

For details, see [LICENSE](./LICENSE) file.
