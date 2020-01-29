# Masters Project

Adaptation of an existing filament model as a two-wall sliding filament model, using spring forces to model passive links and active motor protein links as seen in biological axonemal architecture of flagellum and cilia.

Original repository (accessed 1 October 2019): https://github.com/ekeaveny/filaments/tree/master/matlab-2d-rpy

## Overview
This code demonstrates the use of the method described in [the paper](https://arxiv.org/abs/1903.12609) in simulating a single flexible filament falling under gravity in an infinite domain.

It uses the 'EJBb' version of Broyden's method (Algorithm 2 in the paper) with a reduced 'robot arm' system of nonlinear equations. For the hydrodynamic solver, it uses the RPY tensors.
