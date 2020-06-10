 function main()

N_swimmers = 2;

% ----- Parameters for swimmers -----
% Initial positions of each swimmer
x = [0, 20];
y = [0, 0];
alpha = [0, 0];

% Basic parameters
lambda_s = [15, 25];
k_s = [1.5, 1.5];
beta_A = [1, 1];
zeta = [0.5, 1];
gamma = [5, 1];
phi = [0, 0];

% ----- Motion type (1 = symmetric, 2 = asymmetric I, 3 = asymmetric II, 4 = peristalsis) -----
locomotion_type = [4, 1];

% ----- Passive links -----
passive_links = true;


% ----- Plotting and Saving ------
% For plots
limit = 0.5;    % 0.5 for individuals, and 1 for multiple
filename = strcat(datestr(now, 'yyyymmdd-HHMMSS'), '.txt');  
save_to_file = false;


% ----- Run simulation -----
main_plot(N_swimmers, x, y, alpha, lambda_s, k_s, beta_A, zeta, locomotion_type, gamma, phi, passive_links, filename, save_to_file, limit);


 end