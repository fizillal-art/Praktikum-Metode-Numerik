x = -4:0.2:4;
y = -4:0.2:4;
[X, Y] = meshgrid(x, y);

Z = 2.0 .^ (-1.2 * sqrt(X.^2 + Y.^2)) .* cos(X) .* sin(0.8*Y);

contour3(X, Y, Z, 20);
xlabel('x');
ylabel('y');
zlabel('z');
