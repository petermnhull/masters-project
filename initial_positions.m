function [X, Y, THETA] = initial_positions(X_IN, Y_IN, THETA_IN, N_w, N_sw, filament_separation)

X = X_IN;
Y = Y_IN;
THETA = THETA_IN;

% Initial angle displacement
displacement_theta = pi / 2;

% Additional perturbations
curved_filaments = false;
perturbed = false;


for j=1:N_sw
    for i=1:N_w
        THETA(i + (j-1)*N_w) = displacement_theta;
        
        % Curve the filaments
        if curved_filaments
            THETA(i + (j - 1)*N_w) = THETA(i + (j - 1)*N_w) + i*pi/N_w;
        end
    end
end

% Perturbation of initial position
if perturbed
    THETA(1) = 0.00001;
end

% Position filaments an even distance away from eachother
x_pos = 0;
for i=1:N_sw
    x_pos = x_pos + filament_separation;
    
    X(1+(i-1)*N_w) = x_pos;
end

%X(1) = 0;
%X(N_w + 1) = 5;
%X(2*N_w + 1) = 12;
%X(3*N_w + 1) = 17;
%X(4*N_w + 1) = 24;
%X(5*N_w + 1) = 29;