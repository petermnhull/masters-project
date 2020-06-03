function [save_to_file, graphics, video, plot_step, save_step, ...
    plot_centreline, plot_walls, plot_initial, wdth_centreline, ...
    wdth_wall, plot_links, wdth_links, plot_links_psv, save_plot_to_file] = set_up_graphics()

% Setup
save_to_file = true;
graphics = false;
video = graphics;
plot_step = 10;              % Plot every n timesteps
save_step = 1;                % Save data to file every n timesteps
save_plot_to_file = false;


% Plot centreline and walls of two filaments
plot_centreline = false;
plot_walls = true;
plot_links = true;
plot_links_psv = plot_links;

% Line thicknesses
wdth_centreline = 5;  % 2
wdth_wall = 1;    % 1
wdth_links = 1;   % 1

% Plot initial conditions
plot_initial = true;