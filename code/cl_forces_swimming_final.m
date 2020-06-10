function [FX, FY] = cl_forces_swimming_final(FX_IN, FY_IN, X_IN, Y_IN, N_w, cl_el, nt, L, steps_per_unit_time, N_pairs, lambda_s, k_s, beta_A, zeta, locomotion_type, gamma, phi)

% This function returns a complete asymmetric crosslinked set of forces

FX = FX_IN;
FY = FY_IN;

% Initialise
t = nt;

% Iterate through the swimmers
for i_pairs=1:N_pairs
    
    % Set up parameters for each swimmer
    % Constants for cross links (linear and trig)
    k_a = 1;                              % Young's Constant for Active Cross-Link
    k_b = 1;                              % Young's Constant for Passive Cross-Link
    
    % Driving force amplitude
    lambda = L / lambda_s(i_pairs); 

    % Parameters for wave propagation
    omega = 2 * pi * gamma(i_pairs) / steps_per_unit_time;   % undulation freq
    k = k_s(i_pairs) * 2 * pi;                               % angular wave number
    phase = phi(i_pairs);                                    % phase

    % Additional tail motion
    tail_final = true;
    
    % Iterate through levels of axoneme
    for i=1:(N_w - 1)
    
        % Select segments for cross-links
        seg_a1 = (((2 * i_pairs) - 2) * N_w) + i;
        seg_a2 = (((2 * i_pairs) - 2) * N_w) + N_w + 1 + i;
        seg_b1 = (((2 * i_pairs) - 2) * N_w) + i + 1;
        seg_b2 = (((2 * i_pairs) - 2) * N_w) + N_w + i;
        
        % Arc length
        s = i / N_w;
        
        % Wave propagation
        time_component = k*s - omega*t + phase;
        
        % Standard multiplicative factor on amplitude
        beta = 1;
        
        % Additional tail motion
        if s > zeta(i_pairs) && tail_final
           beta = beta_A(i_pairs) * (1 - ((1 - s) / (1 - zeta(i_pairs))) + ((1 - s) / (1 - zeta(i_pairs))));
        end
        
        % Wave propagation on left links
        el_a = cl_el + lambda * beta * sin(time_component);
        
        % Initialise right links
        el_b = cl_el;
        
        % Wave propagation on right links, sorted by locomotion type
        if locomotion_type(i_pairs) == 1
            el_b = el_b + lambda * beta * sin(time_component + pi); 
        end
        if locomotion_type(i_pairs) == 3
            el_b = el_b + lambda * beta * cos(time_component);
        end
        if locomotion_type(i_pairs) == 4
            el_b = el_b + lambda * beta * sin(time_component);
        end
        
        % Add axonemal driving force to segment
        [FX, FY] = add_spring_force_between_segments(FX, FY, X_IN, Y_IN, seg_a1, seg_a2, k_a, el_a);    
        [FX, FY] = add_spring_force_between_segments(FX, FY, X_IN, Y_IN, seg_b1, seg_b2, k_b, el_b); 
        
    end
    
end