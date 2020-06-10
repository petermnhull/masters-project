 function main()

% ----- Number of swimmers -----
N_swimmers = 2;

% ----- Initial positions of each swimmer -----
x = [10, 0];                  % x position of head
y = [30, 0];                  % y position of head
alpha = [pi/6, pi];           % Angle measured between positive y-axis and direction of travel

% ----- Basic parameters -----
lambda_s = [10, 6];           % Amplitude Ratio
k_s = [1.5, 3];               % Wavenumber
beta_A = [0.5, 1];            % Multiplier on Amplitude
zeta = [0.5, 1];              % Body / Tail Ratio (1 = no tail, 0 = all tail)
gamma = [8, 12];              % Number of undulations per unit time
phi = [0, 0];

% ----- Motion type (1 = symmetric, 2 = peristalsis, 3 = asymmetric I, 4 = asymmetric II) -----
locomotion_type = [1, 2];

% ----- Passive links for swimmers (warning: increase amplitude ratio if false)-----
passive_links = [true, true];

% ----- Simulation Time -----
repetitions = 1;

% ----- Plotting and Saving ------
% For plots
limit = 0.75;    % Recommended: 0.5 for individuals, and 1 for multiple
filename = strcat(datestr(now, 'yyyymmdd-HHMMSS'), '.txt');  
save_to_file = false;

% ----- Run simulation -----
main_plot(N_swimmers, x, y, alpha, lambda_s, k_s, beta_A, zeta, locomotion_type, gamma, phi, passive_links, filename, save_to_file, limit, repetitions);


 end