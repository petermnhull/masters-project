function [FX, FY] = cl_forces_swimming_final(FX_IN, FY_IN, X_IN, Y_IN, N_w, cl_el, nt, L, steps_per_unit_time, N_pairs, lambda_s, k_s, beta_A, zeta, locomotion_type)

% This function returns a complete asymmetric crosslinked set of forces

FX = FX_IN;
FY = FY_IN;

% Constants for cross links (linear and trig)
k_a = 1;                              % Young's Constant for Active Cross-Link
k_b = 1;                              % Young's Constant for Passive Cross-Link
lambda = L / lambda_s;                    % Amplitude

% Parameters for time component
gamma = 5;                                      % Undulations per unit time
omega = 2 * pi * gamma / steps_per_unit_time;   % undulation freq
k = k_s * 2 * pi;                               % angular wave number
phi = 0;                                        % phase

% Additional tail motion
tail_final = true;

% Initialise
t = nt;

for i_pairs=1:N_pairs
    
    for i=1:(N_w - 1)
    
        seg_a1 = (((2 * i_pairs) - 2) * N_w) + i;
        seg_a2 = (((2 * i_pairs) - 2) * N_w) + N_w + 1 + i;
        seg_b1 = (((2 * i_pairs) - 2) * N_w) + i + 1;
        seg_b2 = (((2 * i_pairs) - 2) * N_w) + N_w + i;
        
        s = i / N_w;
        
        time_component = k*s - omega*t + phi;

        beta = 1;
        
        if s > zeta && tail_final
           beta = (beta_A * (1 - ((1 - s) / (1 - zeta)))) + ((1 - s) / (1 - zeta));
        end
        
        
        el_a = cl_el + lambda * beta * sin(time_component);
        
        if locomotion_type == 1
            el_b = cl_el + lambda * beta * sin(time_component + pi); 
        end
        
        if locomotion_type == 2
            el_b = cl_el;
        end
        
        if locomotion_type == 3
            el_b = cl_el + lambda * beta * cos(time_component);
        end
        
        if locomotion_type == 4
            el_b = cl_el + lambda * beta * sin(time_component);
        end
        
        % Add forces
        [FX, FY] = add_spring_force_between_segments(FX, FY, X_IN, Y_IN, seg_a1, seg_a2, k_a, el_a);    
        [FX, FY] = add_spring_force_between_segments(FX, FY, X_IN, Y_IN, seg_b1, seg_b2, k_b, el_b); 
        
    end
    
end