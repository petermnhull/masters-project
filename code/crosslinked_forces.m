function [FX, FY] = crosslinked_forces(FX_IN, FY_IN, X_IN, Y_IN, N_w, k_a, k_b, el_a, el_b)

% This function returns a complete asymmetric crosslinked set of forces

for i=1:(N_w - 1)
        [FX_IN, FY_IN] = add_spring_force_between_segments(FX_IN, FY_IN, X_IN, Y_IN, i, N_w + i + 1, k_a, el_a);    
        [FX_IN, FY_IN] = add_spring_force_between_segments(FX_IN, FY_IN, X_IN, Y_IN, i + 1, N_w + i, k_b, el_b);    
end

FX = FX_IN;
FY = FY_IN;