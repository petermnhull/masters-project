function [FX, FY, T] = cl_forces_hanpeskin_new(FX_IN, FY_IN, X_IN, Y_IN, N_w, N_pairs, dt, T_IN)

% This function returns a complete asymmetric crosslinked set of forces,
% according to Han Peskin paper

% For use with pairs of filaments

FX = FX_IN;
FY = FY_IN;
T = T_IN;

% Parameters for linear system
lambda = 0.5;
beta = 0.5;

for i_pairs=1:N_pairs
    for i=1:(N_w - 1)
            
            % Select segments
            seg_a = (((2 * i_pairs) - 2) * N_w) + i + 1;
            seg_b = (((2 * i_pairs) - 1) * N_w) + i;
            
            % Get level dependant constant
            % - Linear diffusion of ATP
            k = lambda * (1 - ((i - 1) / N_w));
            
            % Get distance between segments
            x_dist = X_IN(seg_a) - X_IN(seg_b);
            y_dist = Y_IN(seg_a) - Y_IN(seg_b);
            r_dist = sqrt(x_dist^2 + y_dist^2);
           
            % Update tension - Forward Euler
            T_OUT = T_IN(seg_a) + (dt * beta * ((k * (r_dist^2)) - T_IN(seg_a)));

            % Resolve forces
            % - angles for x and y components
            cos_alpha = x_dist / r_dist;
            sin_alpha = y_dist / r_dist;
            % - Resolve forces in x and y components
            T_x = T_OUT * cos_alpha;
            T_y = T_OUT * sin_alpha;

            % Apply forces
            FX(seg_a) = FX(seg_a) - T_x;
            FX(seg_b) = FX(seg_b) + T_x;
            FY(seg_a) = FY(seg_a) - T_y;
            FY(seg_b) = FY(seg_b) + T_y;
           
    end
    
    T = T_OUT;

end