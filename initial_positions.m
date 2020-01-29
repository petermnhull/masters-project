function [X, Y, THETA] = initial_positions(X_IN, Y_IN, THETA_IN, N_w, N_sw, filament_separation)

X = X_IN;
Y = Y_IN;
THETA = THETA_IN;

% Initial angle displacement
displacement_theta = pi / 2;

% Additional perturbations
curved_filaments = false;
perturbed = false;


for j=1:2
    for i=1:N_w
        THETA(i + (j-1)*N_w) = displacement_theta;
        
        % Curve the filaments
        if curved_filaments
            THETA(i + (j - 1)*N_w) = THETA(i + (j - 1)*N_w) + i*pi/N_w
        end
    end
end

% Perturbation of initial position
if perturbed
    THETA(1) = 0.00001;
end

% Position filaments an even distance away from eachother
for i=1:N_sw
    X(1+(i-1)*N_w) = filament_separation*(i-1);
end