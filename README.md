# Masters Project

Supplementary Matlab/Octave code to ['Methods for suspensions of passive and active filaments'](https://arxiv.org/abs/1903.12609), 2019, by SF Schoeller, AK Townsend, TA Westwood & EE Keaveny. 

Original repository: https://github.com/ekeaveny/filaments/tree/master/matlab-2d-rpy

This version of the filament model is being used to model flagellum using inextensible filaments as the walls of the flagellum, connected by spring forces which model the active and passive links in the biological axonemal architecture.

## Overview
This code demonstrates the use of the method described in [the paper](https://arxiv.org/abs/1903.12609) in simulating a single flexible filament falling under gravity in an infinite domain.

It uses the 'EJBb' version of Broyden's method (Algorithm 2 in the paper) with a reduced 'robot arm' system of nonlinear equations. For the hydrodynamic solver, it uses the RPY tensors.
