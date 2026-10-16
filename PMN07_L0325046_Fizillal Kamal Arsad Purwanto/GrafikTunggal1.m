%Plot Kurva
x = linspace(-0.3,2.5);
f = @(x) 3*x.^3-5*x.^2+4*x-8;
y = f(x);
plot(x,y)

%Menggambar sumbu x dan y
line([-0.5,3],[0,0]) %Sumbu X
line([0,0],[-12,24]) %Sumbu Y

%Annotation
text(1.0,-10.5,'y = 3x^3-5x^2+4x-8')
text(1.0,6,'Akar')
