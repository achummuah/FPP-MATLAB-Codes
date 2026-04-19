function phi_unwrapped = unwrap_phase(phi_wrapped)

% First unwrap along rows (horizontal)
phi_unwrapped = unwrap(phi_wrapped, [], 2);

% Then unwrap along columns (vertical)
phi_unwrapped = unwrap(phi_unwrapped, [], 1);

% --- Manual 2D quality-guided correction ---
% Compute phase gradients to detect problem regions
[rows, cols] = size(phi_unwrapped);

% Iterative scanline correction: re-anchor each row to its left neighbor
for r = 2:rows
    row_offset = round((phi_unwrapped(r,1) - phi_unwrapped(r-1,1)) / (2*pi));
    phi_unwrapped(r,:) = phi_unwrapped(r,:) - row_offset * 2 * pi;
end

end