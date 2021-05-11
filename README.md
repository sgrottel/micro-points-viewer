# Micro Points Viewer
Super minimalistic 3d point data viewer.

With _point data_, I mean both, volumetric point data, e.g. from simulations, and point cloud data.
The _minimalistic_ aspect includes both, only providing core functionality, and avoiding clever data structures as much as possible.
This viewer is the base for further, more advanced variants.

## Features

* Can load a _fixed (maximum) number_ of points from a simple input file format
* Points are _XYZ RGB_, no transparency
* Points can additionally be `selected`, temporarily changeing their color to a fixed selection color.
* The point data is transformed by one configurable `model` _matrix_.
* There is one _clipping box_ definition, with
    * Extend, and a `model` matrix, and
    * configurations to hide points inside the box, outside the box, or to show all points
* There is only one perspective camera, `view` and `projection` matrices defined by:
    * `position`, `lookat`, `up` vectors
    * `near clip`, `far clip` distance hints
    * `view angle`
* Interactive OpenGL 4.1 core window, based on _GLFW_, _glLoadGen_, _glm_
* Minimalistic UI based on _DearImGui_
* A _screenshot_ can be created at specified resolution (single fbo) and saved as PNG image file
* All features can be controlled via UI and _command line arguments_, allowing for batch processing
    * Exception apply, e.g. loading data is only available via command line arguments.

## Build

TODO

## License

This software is available under the terms of Apache License 2.0.

For details, see [LICENSE](./LICENSE) file.
