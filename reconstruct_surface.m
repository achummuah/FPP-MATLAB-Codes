function Z_recon = reconstruct_surface(phi_unwrapped)

[rows, cols] = size(phi_unwrapped);
[x, ~] = meshgrid(linspace(0, 2*pi, cols), linspace(0, 2*pi, rows));

k = 10;
scale = 20;

% Remove the carrier fringe contribution
phi_object = phi_unwrapped - k * x;

% Convert phase to height
Z_recon = phi_object / scale;

% Shift so minimum is zero
Z_recon = Z_recon - min(Z_recon(:));

end