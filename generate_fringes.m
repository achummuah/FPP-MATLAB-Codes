function [x, y, I1, I2, I3] = generate_fringes()

[x, y] = meshgrid(linspace(0, 2*pi, 400), linspace(0, 2*pi, 400));

k = 10;

I1 = cos(k*x - 2*pi/3);
I2 = cos(k*x);
I3 = cos(k*x + 2*pi/3);

end