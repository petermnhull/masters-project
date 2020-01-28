function [FX, FY] = cl_forces_hanpeskin(FX_IN, FY_IN, X_IN, Y_IN, N_w, gamma)

% This function returns a complete asymmetric crosslinked set of forces,
% according to Han Peskin paper

FX = FX_IN;
FY = FY_IN;

for i=1:(N_w - 1)
        
        seg_a = i + 1;
        seg_b = N_w + i;
        
        % Get constant
        k = gamma * (1 - ((i - 1) / N_w));
        
        % Set arbitrary constant
        c = 0.1;
        
        % Get distance between segments
        x_dist = X_IN(seg_a) - X_IN(seg_b);
        y_dist = Y_IN(seg_a) - Y_IN(seg_b);
        r_dist = sqrt(x_dist^2 + y_dist^2);
        
        % Get tension
        tension = (k * (r_dist)) - (c * exp(1));
        
        % Resolve forces
        
        % angles for x and y components
        cos_alpha = x_dist / r_dist;
        sin_alpha = y_dist / r_dist;

        % Resolve forces in x and y components
        tension_x = tension * cos_alpha;
        tension_y = tension * sin_alpha;

        % Apply forces
        FX(seg_a) = FX(seg_a) + tension_x;
        FX(seg_b) = FX(seg_b) - tension_x;
        FY(seg_a) = FY(seg_a) + tension_y;
        FY(seg_b) = FY(seg_b) - tension_y;
        
end