function [FX, FY] = cl_forces_swimming_final(FX_IN, FY_IN, X_IN, Y_IN, N_w, cl_el, nt, L, steps_per_unit_time, p, N_pairs)

% This function returns a complete asymmetric crosslinked set of forces

FX = FX_IN;
FY = FY_IN;

% Constants for cross links (linear and trig)
k_a = 1;                              % Young's Constant for Active Cross-Link
k_b = 1;                              % Young's Constant for Passive Cross-Link
lambda_s = 10;            % standard is 10/25
lambda = L / lambda_s;                    % Amplitude

% Parameters for time component
gamma = 5;
omega = 2 * pi * gamma / steps_per_unit_time;   % undulation freq
k_s = 100; %standard is 100
k = k_s * 2 * pi / L;                                    % wave number
phi = 0;                                     % phase

% --- ADDITIONAL BEHAVIOUR
% Additional tail motion
tail_motion = false;
tail_motion_more = false;

% Variation of amplitude
var_ampl = false;
lambda_ss = [10, 25, 100, 40];

% Opposite directions
var_direction = false;

% Variation of phases
var_phase = true;
phis = [0, pi/2, pi/9, pi/5, pi/2];

% Initialise
t = nt;

for i_pairs=1:N_pairs
    if var_ampl
        lambda = L / lambda_ss(i_pairs);
    end
    
    for i=1:(N_w - 1)
    
        seg_a1 = (((2 * i_pairs) - 2) * N_w) + i;
        seg_a2 = (((2 * i_pairs) - 2) * N_w) + N_w + 1 + i;
        seg_b1 = (((2 * i_pairs) - 2) * N_w) + i + 1;
        seg_b2 = (((2 * i_pairs) - 2) * N_w) + N_w + i;
        
        s = i / N_w;
        
        if var_direction
            if mod(i_pairs, 2) == 0
                s = i / N_w;
            else
                s = 1 - (i / N_w);
            end
        end
        
        if var_phase
            phi = phis(i_pairs);
        end
        
        time_component = k*s - omega*t + phi;

        beta = 1;

        if s > 0.5 && tail_motion
            beta = 2 * (1 - s);
            %beta = (2*(p - 1)*s) + 2 - p;           % <--- wiggly tails
        end
        
        if s > 0.25 && tail_motion_more
           beta = (1 / 15) * (16*(p - 1)*s^2 + 16 - p); % <--- very wiggly tails 
           %beta = (64/63)*(p - 1)*s^3 + p - (64/63)*(p - 1); % <--- very very wiggly tails
        end

        el_a = cl_el + lambda * beta * sin(time_component);
        %el_b = cl_el + lambda * beta * cos(time_component);
        %el_b = cl_el + lambda * beta * sin(time_component);
        %el_b = cl_el;
        el_b = cl_el + lambda * beta * sin(time_component + pi);

        % Add forces
        [FX, FY] = add_spring_force_between_segments(FX, FY, X_IN, Y_IN, seg_a1, seg_a2, k_a, el_a);    
        [FX, FY] = add_spring_force_between_segments(FX, FY, X_IN, Y_IN, seg_b1, seg_b2, k_b, el_b); 
        
    end
    
end