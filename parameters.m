function [max_broyden_steps, steps_per_unit_time, num_settling_times, concheck_tol] = parameters(Np)

% Iteration information
max_broyden_steps = 3*Np;
steps_per_unit_time = 600;     % for sedimenting, unit time T = L^2 mu / F
num_settling_times = 1;        % number of settling (unit) times
concheck_tol = 1e-4;           % Broyden's tolerance
