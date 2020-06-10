function [max_broyden_steps, steps_per_unit_time, repetitions, concheck_tol] = parameters(Np)

% Iteration information
max_broyden_steps = 3*Np;
T_standard = 600;
mult = 3;
steps_per_unit_time = T_standard * mult;     % for sedimenting, unit time T = L^2 mu / F
repetitions = 1;    % number of settling (unit) times
concheck_tol = 1e-4;           % Broyden's tolerance
