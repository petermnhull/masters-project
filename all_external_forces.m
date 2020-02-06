function [FX, FY] = all_external_forces(FX_IN, FY_IN, X_S, Y_S, N_w, DL, filament_separation, N_pairs)

FX = FX_IN;
FY = FY_IN;

% Forces to include
gravity = false;

passive_links_full = false;

cross_links_trig = false;
cross_links_linear = true;

external_pinch = false;

% -- PARAMETERS (NOT FOR HAN PESKIN)--

% Cross link equilibrium length
cl_el = sqrt(filament_separation^2 + DL^2);

% Constant for full passive links
k_f = 15;

% Constants for external pinch
k_e = 1;
%seg_a =  N_w + 3;
%seg_b =  N_w + 8;

% ---- Add Forces ----

if gravity
    FY = -weight_per_unit_length*L/N_w*ones(Np,1);
end
    
% Cross linked forces with variable arc length, trig
if cross_links_trig
    [FX, FY] = cl_forces_variable_al(FX, FY, X_S, Y_S, N_w, cl_el);
end
    
% Cross linked forces with variable arc length, linear
if cross_links_linear
    [FX, FY] = cl_forces_variable_al_linear(FX, FY, X_S, Y_S, N_w, cl_el);
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