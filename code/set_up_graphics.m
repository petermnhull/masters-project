function [save_to_file, graphics, video, plot_step, save_step, ...
    plot_centreline, plot_walls, plot_initial, wdth_centreline, ...
    wdth_wall, plot_links, wdth_links, plot_links_psv, save_plot_to_file] = set_up_graphics()

% Setup
save_to_file = true;
graphics = true;
video = graphics && true;
plot_step = 100;              % Plot every n timesteps
save_step = 1;                % Save data to file every n timesteps
save_plot_to_file = graphics && true;


% Plot centreline and walls of two filaments
plot_centreline = false;
plot_walls = true;
plot_links = true;
plot_links_psv = plot_links;

% Line thicknesses
wdth_centreline = 2;
wdth_wall = 1;
wdth_links = 1;

% Plot initial conditions
plot_initial = true;