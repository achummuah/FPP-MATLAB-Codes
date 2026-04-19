function [I1_d, I2_d, I3_d] = apply_distortion(I1, I2, I3, Z)

Z_resized = imresize(Z, [size(I1,1), size(I1,2)]);

k = 10;
[x, ~] = meshgrid(linspace(0, 2*pi, size(I1,2)), ...
                  linspace(0, 2*pi, size(I1,1)));

scale = 20;

I1_d = cos(k*x + scale*Z_resized - 2*pi/3);
I2_d = cos(k*x + scale*Z_resized);
I3_d = cos(k*x + scale*Z_resized + 2*pi/3);

end