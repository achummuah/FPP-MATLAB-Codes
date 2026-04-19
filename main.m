clc; clear; close all;

% Step 1: Object
[X, Y, Z] = create_spike_surface();
figure;
surf(X, Y, Z);
shading interp;
axis equal;
title('Original Spike Ball');
% Step 2: Fringes
[x, y, I1, I2, I3] = generate_fringes();
figure;

subplot(1,3,1);
imagesc(I1);
colormap gray;
title('Original Fringe I1');

subplot(1,3,2);
imagesc(I2);
colormap gray;
title('Original Fringe I2');

subplot(1,3,3);
imagesc(I3);
colormap gray;
title('Original Fringe I3');

% Step 3: Distortion
[I1_d, I2_d, I3_d] = apply_distortion(I1, I2, I3, Z);
figure;

subplot(1,3,1);
imagesc(I1_d);
colormap gray;
title('Distorted Fringe I1');

subplot(1,3,2);
imagesc(I2_d);
colormap gray;
title('Distorted Fringe I2');

subplot(1,3,3);
imagesc(I3_d);
colormap gray;
title('Distorted Fringe I3');
% Step 4: Phase
phi_wrapped = compute_phase(I1_d, I2_d, I3_d);
figure;
imagesc(phi_wrapped);
colormap jet;
colorbar;
title('Wrapped Phase');

% Step 5: Unwrap
phi_unwrapped = unwrap_phase(phi_wrapped);
figure;
imagesc(phi_unwrapped);
colormap jet;
colorbar;
title('Unwrapped Phase');

% Step 6: Reconstruction
Z_recon = reconstruct_surface(phi_unwrapped);

% Plot result
[Xr, Yr] = meshgrid(1:size(Z_recon,2), 1:size(Z_recon,1));

figure;
surf(Z_recon);
shading interp;
colormap jet;
colorbar;
title('Reconstructed 3D Surface');
view(3);