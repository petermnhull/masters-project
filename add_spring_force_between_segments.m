function [FX, FY] = add_spring_force_between_segments(FX_IN, FY_IN, X_IN, Y_IN, segment_a, segment_b, k, el)

% Take in:
%   - Forces in X and Y directions
%   - Positions in X and Y directions
%   - Two segments we want to add forces between
%   - Hooke's constant

% Return:
%   - Updated forces in X and Y directions

X = X_IN;
Y = Y_IN;
FX = FX_IN;
FY = FY_IN;

% Calculate distances
x_dist = X(segment_a) - X(segment_b);
y_dist = Y(segment_a) - Y(segment_b);

% Distance
r = sqrt(x_dist^2 + y_dist^2);
r_force = -1 * k * (r - el);

% angles for x and y components
cos_alpha = x_dist / r;
sin_alpha = y_dist / r;

% Resolve forces in x and y components
force_x_comp = r_force * cos_alpha;
force_y_comp = r_force * sin_alpha;

% Apply forces
FX(segment_a) = FX(segment_a) + force_x_comp;
FX(segment_b) = FX(segment_b) - force_x_comp;
FY(segment_a) = FY(segment_a) + force_y_comp;
FY(segment_b) = FY(segment_b) - force_y_comp;

