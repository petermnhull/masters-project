function [a, N_sw, N_w, Np, N_lam, B, weight_per_unit_length, DL, L, mu, KB, KBdivDL, N_pairs, tethered, gravity, base_case] = data(N_input, N_pairs_input)

% Number of pairs of filaments
N_pairs = N_pairs_input;

% Tethering
tethered = false;

% Gravity
gravity = false;

% Base Case
base_case = false;

% Filament data
a = 1;                        % segment 'radius' (half filament width)
N_sw = 2 * N_pairs;           % number of filaments
N_w = N_input;                     % number of segments in filament (21)
Np = N_sw*N_w;                % total number of segments
N_lam = N_sw*(N_w - 1);       % number of lambdas

B = 1000;                      % dimensionless elasto-gravitational number B
weight_per_unit_length = 1e0;  % weight per unit length W

DL_factor = 2.2;               % 2.2               
DL = DL_factor*a;              % distance between segment centres, Delta L
L = N_w*DL;                    % filament length L
mu = 10;                       % fluid viscosity

KB = weight_per_unit_length*L^3/B;         % bending modulus, K_B
KBdivDL = KB/DL;