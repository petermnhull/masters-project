function [FX, FY] = cl_forces_variable_al(FX_IN, FY_IN, X_IN, Y_IN, N_w, cl_el, L)

% This function returns a complete asymmetric crosslinked set of forces

FX = FX_IN;
FY = FY_IN;

% Constants for cross links (linear and trig)
k_a = 1;
k_b = 1;
lambda = L/10;

for i=1:(N_w - 1)
        el_a = cl_el + lambda * sin(pi * (i) / N_w);
        el_b = cl_el + lambda * cos(pi * (i) / N_w);
            
        [FX, FY] = add_spring_force_between_segments(FX, FY, X_IN, Y_IN, i, N_w + i + 1, k_a, el_a);    
        [FX, FY] = add_spring_force_between_segments(FX, FY, X_IN, Y_IN, i + 1, N_w + i, k_b, el_b);    
end