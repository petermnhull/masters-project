# Masters Project

Adaptation of an existing single filament model for modelling a two-dimensional microswimmer axoneme. The axoneme is comprised of two Kirchhoff filaments inter-connected through a series of cross-links that generate internal driving forces for movement. The code is set up for easy use so that multiple swimmers with different behaviours can be simulated.

This code adapts the method described [here](https://arxiv.org/abs/1903.12609) in simulating a single flexible filament falling under gravity in an infinite domain.  It uses the 'EJBb' version of Broyden's method (Algorithm 2 in the paper) with a reduced 'robot arm' system of nonlinear equations. For the hydrodynamic solver, it uses the RPY tensors.

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
