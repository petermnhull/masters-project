function [FX, FY] = cl_forces_variable_al_linear_osc(FX_IN, FY_IN, X_IN, Y_IN, N_w, cl_el, nt, TOTAL_STEPS)

% This function returns a complete asymmetric crosslinked set of forces

FX = FX_IN;
FY = FY_IN;

% Constants for cross links (linear and trig)
k_a = 1;
k_b = 1;
lambda = 3;

% Initialise
t = nt;

for i=1:(N_w - 1)
        % Parameters for time component
        reps = 6;
        scale = 2;
        time_component = scale * sin(reps * pi * t / TOTAL_STEPS);
        
        % Equilibrium lengths
        el_a = cl_el + lambda * time_component * ((i - 1) / N_w);
        el_b = cl_el + lambda * time_component * (1 - ((i - 1) / N_w));
        
        % Add forces
        [FX, FY] = add_spring_force_between_segments(FX, FY, X_IN, Y_IN, i, N_w + i + 1, k_a, el_a);    
        [FX, FY] = add_spring_force_between_segments(FX, FY, X_IN, Y_IN, i + 1, N_w + i, k_b, el_b);    
end