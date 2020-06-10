# Masters Project

Adaptation of an existing filament model as a two-wall sliding filament model, using cross-linked forces between two Kirchhoff rods to model passive links and active motor protein links as seen in biological axonemal architecture of the flagellum.

Original repository (accessed 1 October 2019): https://github.com/ekeaveny/filaments/tree/master/matlab-2d-rpy

## Overview
This original code demonstrates the use of the method described [here](https://arxiv.org/abs/1903.12609) in simulating a single flexible filament falling under gravity in an infinite domain. This version adapts the code for modelling the dynamics of swimming microorganisms in Stokes Flow.

It uses the 'EJBb' version of Broyden's method (Algorithm 2 in the paper) with a reduced 'robot arm' system of nonlinear equations. For the hydrodynamic solver, it uses the RPY tensors.

## Instructions
1. Clone repository.
2. Open main_plot.m
3. Choose number of swimmers.
4. Choose parameters for each swimmer: amplitude ratio, wave number, etc.
5. Choose whether to save velocities, etc. to file.
6. Run!

## Additional Instructions
- Access set_up_graphics.m to change the plotting, and to disable graphics or saving video to file.
- Access parameters.m to change the running time, steps per unit time, etc.
