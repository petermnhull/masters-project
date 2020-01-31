function [save_to_file, graphics, video, plot_step, save_step, ...
    plot_centreline, plot_walls, plot_initial, wdth_centreline, ...
    wdth_wall] = set_up_graphics()

% Setup
save_to_file = false;
graphics = true;
video = false;
plot_step = 10;                % Plot every n timesteps
save_step = 10;                % Save data to file every n timesteps

% Plot centreline and walls of two filaments
plot_centreline = true;
plot_walls = true;

% Line thicknesses
wdth_centreline = 3;
wdth_wall = 5;

% Plot initial conditions
plot_initial = true;