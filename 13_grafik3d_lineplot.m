t = 0:0.05:8*pi;
x = sqrt(2*t) .* sin(3*t);
y = sqrt(2*t) .* cos(3*t);
z = 0.2 * t;

plot3(x, y, z, 'r', 'linewidth', 1.5);
grid on;
xlabel('x');
ylabel('y');
zlabel('z');
