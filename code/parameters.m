function [max_broyden_steps, steps_per_unit_time, concheck_tol] = parameters(Np)

% Iteration information
max_broyden_steps = 3*Np;
T_standard = 600;
mult = 1;
steps_per_unit_time = T_standard * mult;     % for sedimenting, unit time T = L^2 mu / F
concheck_tol = 1e-4;           % Broyden's tolerance
