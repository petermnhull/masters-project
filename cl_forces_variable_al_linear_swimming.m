function [FX, FY] = cl_forces_variable_al_linear_swimming(FX_IN, FY_IN, X_IN, Y_IN, N_w, cl_el, nt, TOTAL_STEPS, k, lambda)

% This function returns a complete asymmetric crosslinked set of forces

FX = FX_IN;
FY = FY_IN;

% Constants for cross links (linear and trig)
k_a = 1;                              % Young's Constant for Active Cross-Link
k_b = 1;                              % Young's Constant for Passive Cross-Link
%lambda = 5;                          % Amplitude

% Parameters for time component
gamma = 5;
omega = 2 * pi * gamma / TOTAL_STEPS;        % undulation freq
%k = 0.3;                                    % wave number
phi = 0;                                     % phase

% Additional tail motion
tail_motion = false;

% Initialise
t = nt;

for i=1:(N_w - 1)
            
    time_component = sin(k*(i - 1) - omega*t + phi);
            
    beta = 1;
    
    if i > (N_w / 2) && tail_motion
        beta = 2 * (1 - (i / N_w));
    end
    
    el_a = cl_el + lambda * time_component * beta;
    el_b = cl_el;

    % Add forces
    [FX, FY] = add_spring_force_between_segments(FX, FY, X_IN, Y_IN, i, N_w + i + 1, k_a, el_a);    
    [FX, FY] = add_spring_force_between_segments(FX, FY, X_IN, Y_IN, i + 1, N_w + i, k_b, el_b); 
    
end