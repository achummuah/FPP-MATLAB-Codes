function [X, Y, Z] = create_spike_surface()

[X, Y] = meshgrid(linspace(-1, 1, 200), linspace(-1, 1, 200));

% Bumpy dome — single-valued height map, always positive
R = sqrt(X.^2 + Y.^2);
Z = (1 - R.^2) .* (1 + 0.3*sin(10*pi*X).*sin(10*pi*Y));
Z = max(Z, 0);  % clip negatives at edges

end