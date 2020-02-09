function [FX, FY] = cl_forces_variable_al_linear(FX_IN, FY_IN, X_IN, Y_IN, N_w, cl_el)

% This function returns a complete asymmetric crosslinked set of forces

FX = FX_IN;
FY = FY_IN;

% Constants for cross links (linear and trig)
k_a = 1;
k_b = 1;
lambda = 3;

for i=1:(N_w - 1)

        el_a = cl_el + lambda * ((i - 1) / N_w);
        el_b = cl_el + lambda * (1 - ((i - 1) / N_w));
        
        [FX, FY] = add_spring_force_between_segments(FX, FY, X_IN, Y_IN, i, N_w + i + 1, k_a, el_a);    
        [FX, FY] = add_spring_force_between_segments(FX, FY, X_IN, Y_IN, i + 1, N_w + i, k_b, el_b);    
end