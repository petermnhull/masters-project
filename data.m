function [a, N_sw, N_w, Np, N_lam, B, weight_per_unit_length, DL, L, mu, KB, KBdivDL] = data()

% Filament data
a = 1;                        % segment 'radius' (half filament width)
N_sw = 2;                     % number of filaments
N_w = 21;                     % number of segments in filament
Np = N_sw*N_w;                % total number of segments
N_lam = N_sw*(N_w - 1);       % number of lambdas

B = 1000;                      % dimensionless elasto-gravitational number B
weight_per_unit_length = 1e0;  % weight per unit length W

DL_factor = 2.2;               
DL = DL_factor*a;              % distance between segment centres, Delta L
L = N_w*DL;                    % filament length L
mu = 10;                       % fluid viscosity

KB = weight_per_unit_length*L^3/B;         % bending modulus, K_B
KBdivDL = KB/DL;