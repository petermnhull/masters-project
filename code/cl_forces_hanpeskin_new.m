function [FX, FY, T] = cl_forces_hanpeskin_new(FX_IN, FY_IN, X_IN, Y_IN, N_w, N_pairs, dt, T_IN, cl_el, nt)

% This function returns a complete asymmetric crosslinked set of forces,
% according to Han Peskin paper

% Proof of concept, however the use is limited by absence of tethering
% which is very intensive for the hydrodynamic solver.

% For use with pairs of filaments

FX = FX_IN;
FY = FY_IN;
T = T_IN;
T_OUT = T_IN;

% Parameters for linear system
lambda = 10; %0.5
beta = 20; %1.6

t = nt;

    for i=1:(N_w - 1)
            
            % Select segments
            seg_a = i + 1;
            seg_b = N_w + i;
            
            % Get level dependant constant
            % - Linear diffusion of ATP
            k = lambda * (1 - ((i / N_w)));

            % Get distance between segments
            x_dist = X_IN(seg_a) - X_IN(seg_b);
            y_dist = Y_IN(seg_a) - Y_IN(seg_b);
            r_dist = sqrt(x_dist^2 + y_dist^2);
                       
            % Update tension - Forward Euler
            T_OUT(seg_a) = T_IN(seg_a) + (dt * beta * ((k * (nthroot(r_dist, 2) - T_IN(seg_a)))));
            
            % Resolve forces
            % - angles for x and y components
            cos_alpha = x_dist / r_dist;
            sin_alpha = y_dist / r_dist;
            % - Resolve forces in x and y components
            T_x = T_OUT(seg_a) * cos_alpha * sin(2*pi*t*3 / 600);
            T_y = T_OUT(seg_a) * sin_alpha * sin(2*pi*t*3 / 600);
           
            
            % Apply forces
            FX(seg_a) = FX(seg_a) + T_x;
            FX(seg_b) = FX(seg_b) + T_x;
            FY(seg_a) = FY(seg_a) + T_y;
            FY(seg_b) = FY(seg_b) + T_y;
            
    end
    
    T = T_OUT;