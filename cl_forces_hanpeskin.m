function [FX, FY] = cl_forces_hanpeskin(FX_IN, FY_IN, X_IN, Y_IN, N_w, nt, TOTAL_STEPS, N_pairs)

% This function returns a complete asymmetric crosslinked set of forces,
% according to Han Peskin paper

% For use with pairs of filaments

% gamma is some scale for level dependance
% c is an arbitrary constant of integration
% beta is a length-independant parameter of the dynamical system

FX = FX_IN;
FY = FY_IN;

% eps : controls ATP at tip
% gamma : controls ATP at source
% beta : length-independant dynamical constant
% c : constant of integration of dynamical system
% -- (seems to control power stroke)

% Parameters for 1/r^2 system
%eps = 0.001;
%gamma = 1.455;
%beta = 2.3;
%c = 0.01;

% Parameters for linear system
gamma = 1.455;
beta = 2.3;
c = 14;
for i_pairs=1:N_pairs
    for i=1:(N_w - 1)
        
            seg_a = (((2 * i_pairs) - 2) * N_w) + i + 1;
            seg_b = (((2 * i_pairs) - 1) * N_w) + i;
            
            % Get level dependant constant
            % - Linear diffusion of ATP
            k = gamma * (1 - ((i - 1) / N_w));
            % - 1/r^2 diffusion ATP
            %k = gamma + (gamma - eps)*(N_w^2 / (N_w^2 - 1))*((1 - i^2)/i^2);

            % Get distance between segments
            x_dist = X_IN(seg_a) - X_IN(seg_b);
            y_dist = Y_IN(seg_a) - Y_IN(seg_b);
            r_dist = sqrt(x_dist^2 + y_dist^2);

            % Get tension
            tension = (k * (r_dist^2)) - (c * exp(-beta*nt / TOTAL_STEPS));

            % Resolve forces

            % angles for x and y components
            cos_alpha = x_dist / r_dist;
            sin_alpha = y_dist / r_dist;

            % Resolve forces in x and y components
            tension_x = tension * cos_alpha;
            tension_y = tension * sin_alpha;

            % Apply forces
            FX(seg_a) = FX(seg_a) - tension_x;
            FX(seg_b) = FX(seg_b) + tension_x;
            FY(seg_a) = FY(seg_a) - tension_y;
            FY(seg_b) = FY(seg_b) + tension_y;

    end
end