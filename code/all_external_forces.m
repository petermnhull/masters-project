function [FX, FY] = all_external_forces(FX_IN, FY_IN, X_S, Y_S, N_w, DL, filament_separation, N_pairs, nt, steps_per_unit_time, dt, T_S, L)

FX = FX_IN;
FY = FY_IN;

% Forces to include

passive_links_full = false;

cross_links_trig = false;
cross_links_linear = false;
cross_links_linear_osc = false;
cross_links_swimming = true;
cross_links_han_peskin = false;

external_pinch = false;

% -- PARAMETERS (NOT FOR HAN PESKIN)--

% Cross link equilibrium length
cl_el = sqrt(filament_separation^2 + DL^2);

% Constant for full passive links
k_f = 10;

% Constants for external pinch
k_e = 1;
%seg_a =  N_w + 3;
%seg_b =  N_w + 8;

% ---- Add Forces ----
    
% Cross linked forces with variable arc length, trig
if cross_links_trig
    [FX, FY] = cl_forces_variable_al(FX, FY, X_S, Y_S, N_w, cl_el);
end
    
% Cross linked forces with variable arc length, linear
if cross_links_linear
    [FX, FY] = cl_forces_variable_al_linear(FX, FY, X_S, Y_S, N_w, cl_el);
end

% Cross linked forces with variable arc length, linear
if cross_links_linear_osc
    [FX, FY] = cl_forces_variable_al_linear_osc(FX, FY, X_S, Y_S, N_w, cl_el, nt, steps_per_unit_time);
end

% Cross linked forces with variable arc length, linear, swimming
if cross_links_swimming
    [FX, FY] = cl_forces_swimming_final(FX, FY, X_S, Y_S, N_w, cl_el, nt, L, steps_per_unit_time);
end

if cross_links_han_peskin
    [FX, FY, T] = cl_forces_hanpeskin_new(FX, FY, X_S, Y_S, N_w, N_pairs, dt, T_S, cl_el);
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
   
% External pinch
if external_pinch
    [FX, FY] = add_spring_force_between_segments(FX, FY, X_S, Y_S, seg_a, seg_b, k_e, filament_separation);
end