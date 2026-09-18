x = 0:0.02:2*pi;
y = -5 * sin(3*x) - 4 * cos(2*x);
z = 6 * sin(5*x) .* -4 .* cos(8*x);

plot(x, y, x, z);
