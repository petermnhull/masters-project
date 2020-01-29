function [save_to_file, graphics, video, plot_step, save_step, plot_centreline, plot_walls, plot_initial] = set_up_graphics()

% Setup
save_to_file = false;
graphics = true;
video = false;
plot_step = 5;                % Plot every n timesteps
save_step = 5;                % Save data to file every n timesteps

% Plot centreline and walls of two filaments
plot_centreline = true;
plot_walls = true;

% Plot initial conditions
plot_initial = true;