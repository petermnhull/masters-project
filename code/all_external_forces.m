function [FX, FY] = all_external_forces(FX_IN, FY_IN, X_S, Y_S, N_w, DL, filament_separation, N_pairs, nt, steps_per_unit_time, dt, T_S, L, p, q)

FX = FX_IN;
FY = FY_IN;

% Forces to include

passive_links_full = true;

cross_links_swimming = true;
cross_links_han_peskin = false;

% -- PARAMETERS --
% Cross link equilibrium length
cl_el = sqrt(filament_separation^2 + DL^2);

% Constant for full passive links
k_f = 10; %10

% ---- Add Forces ----

% Cross linked forces with variable arc length, linear, swimming
if cross_links_swimming
    [FX, FY] = cl_forces_swimming_final(FX, FY, X_S, Y_S, N_w, cl_el, nt, L, steps_per_unit_time, p, q, N_pairs);
end

if cross_links_han_peskin
    [FX, FY, T] = cl_forces_hanpeskin_new(FX, FY, X_S, Y_S, N_w, N_pairs, dt, T_S, cl_el, nt);
end
    
% Passive Links (every set of segments)
% - for use with pairs of filaments
if passive_links_full
    for i_pairs=1:N_pairs
        for j=1:N_w
            seg_a = (((2 * i_pairs) - 2) * N_w) + j;
            seg_b = (((2 * i_pairs) - 1) * N_w) + j;
            
            [FX, FY] = add_spring_force_between_segments(FX, FY, X_S, Y_S, seg_a, seg_b, k_f, filament_separation);
        end
    end
end