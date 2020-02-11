function [FX, FY] = cl_forces_variable_al_linear_swimming(FX_IN, FY_IN, X_IN, Y_IN, N_w, cl_el, nt, TOTAL_STEPS)

% This function returns a complete asymmetric crosslinked set of forces

FX = FX_IN;
FY = FY_IN;

% Constants for cross links (linear and trig)
k_a = 1;                              % Young's Constant for Active Cross-Link
k_b = 1;                              % Young's Constant for Passive Cross-Link
lambda = 10;                          % Amplitude

% Parameters for time component
time_div = 1;
speed = 5;
omega = 2 * pi * speed / (time_div * TOTAL_STEPS);        % undulation freq
k = 1;                                                    % wave number
phi = 0;                                                  % phase

% Divisions of filament
div = 2;

% Segments per division
spdiv = floor(N_w / div);

% Additional tail motion
tail_motion = true;

% Initialise
t = nt;

for j=1:div
    seg_start = 1 + (spdiv * (j - 1));
    seg_end = seg_start + spdiv - 1;
    
    if seg_end == N_w
        seg_end = seg_end - 1;
    end
    
    for i=seg_start:seg_end
            
        time_component = sin(k*(i - 1) - omega*t + phi);
            
        scale = 1;
        
        if j == 2 && tail_motion
            scale = 2 * (1 - ((i - 1) / N_w));
        end
            
        el_a = cl_el + lambda * time_component * scale;
        el_b = cl_el;

        % Add forces
        [FX, FY] = add_spring_force_between_segments(FX, FY, X_IN, Y_IN, i, N_w + i + 1, k_a, el_a);    
        [FX, FY] = add_spring_force_between_segments(FX, FY, X_IN, Y_IN, i + 1, N_w + i, k_b, el_b);    
    end
end