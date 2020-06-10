 function main()

N_swimmers = 2;

% ----- Initial positions of each swimmer -----
x = [0, 20];
y = [0, 0];                  
alpha = [0, 0];                % Orientation

% ----- Basic parameters -----
lambda_s = [10, 10];           % Amplitude Ratio
k_s = [1.5, 3];                % Wavenumber
beta_A = [1, 1];               % Multiplier on Amplitude
zeta = [1, 1];                 % Body / Tail Ratio (1 = no tail, 0 = all tail)
gamma = [5, 10];               % Phase
phi = [0, 0];

% ----- Motion type (1 = symmetric, 2 = peristalsis, 3 = asymmetric I, 4 = asymmetric II) -----
locomotion_type = [1, 2];

% ----- Passive links -----
passive_links = true;

% ----- Plotting and Saving ------
% For plots
limit = 0.5;    % Recommended: 0.5 for individuals, and 1 for multiple
filename = strcat(datestr(now, 'yyyymmdd-HHMMSS'), '.txt');  
save_to_file = false;


% ----- Run simulation -----
main_plot(N_swimmers, x, y, alpha, lambda_s, k_s, beta_A, zeta, locomotion_type, gamma, phi, passive_links, filename, save_to_file, limit);


 end