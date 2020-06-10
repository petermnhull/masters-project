 function main()

N_swimmers = 1;

% ----- Parameters for swimmers -----
% Initial positions of each swimmer
x = [0];
y = [0];
alpha = [0];

% Basic parameters
lambda_s = 15;
k_s = 3;
beta_A = 4;
zeta = 0.5;

% Motion type (1 = symmetric, 2 = asymmetric, 3 = asymmetric type 2, 4 = peristalsis)
locomotion_type = 4;


% ----- Plotting and Saving ------
% For plots
limit = 0.5;    % 0.5 for individuals, and 1 for multiple
filename = strcat(datestr(now, 'yyyymmdd-HHMMSS'), '.txt');  
save_to_file = false;


% Run simulation 
main_plot(N_swimmers, x, y, alpha, lambda_s, k_s, beta_A, zeta, locomotion_type, filename, save_to_file, limit);




 end