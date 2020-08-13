# Masters Project

Adaptation of an existing single filament model for modelling a two-dimensional microswimmer axoneme. The axoneme is comprised of two Kirchhoff filaments inter-connected through a series of cross-links that generate internal driving forces for movement. The code is set up for easy use so that multiple swimmers with different behaviours can be simulated.

The code uses the method described [here](https://arxiv.org/abs/1903.12609) for modelling a single kirchhoff filament falling under gravity. It uses the EJBb version of Broyden's method with a reduced system of nonlinear equations. For solving the hydrodynamic forces it uses the RPY tensor.

Original repository for single filaments falling under gravity (accessed 1 October 2019): https://github.com/ekeaveny/filaments/tree/master/matlab-2d-rpy

## Instructions
1. Clone repository.
2. Open main.m
3. Choose number of swimmers.
4. Choose parameters for each swimmer: amplitude ratio, wave number, etc.
5. Choose whether to save velocities, etc. to file.
6. Run!

## Additional Instructions
- Access set_up_graphics.m to change the plotting, and to disable graphics or saving video to file.
- Access parameters.m to change the running time, steps per unit time, etc.
