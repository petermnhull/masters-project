function [FX, FY] = cl_forces_variable_al_linear(FX_IN, FY_IN, X_IN, Y_IN, N_w, k_a, k_b, el_init_a, el_init_b, lambda)

% This function returns a complete asymmetric crosslinked set of forces

FX = FX_IN;
FY = FY_IN;

for i=1:(N_w - 1)
        el_a = el_init_a + lambda * ((i - 1) / N_w);
        el_b = el_init_b + lambda * (1 - ((i - 1) / N_w));
            
        [FX, FY] = add_spring_force_between_segments(FX, FY, X_IN, Y_IN, i, N_w + i + 1, k_a, el_a);    
        [FX, FY] = add_spring_force_between_segments(FX, FY, X_IN, Y_IN, i + 1, N_w + i, k_b, el_b);    
end