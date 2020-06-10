 function main()

N_swimmers = 1;

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
 
main_plot(N_swimmers, x, y, alpha, lambda_s, k_s, beta_A, zeta, locomotion_type);

 end