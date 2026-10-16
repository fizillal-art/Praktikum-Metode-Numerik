%Plot Kurva
x = linspace(-0.3,2.5);
f1 = @(x) 3*x.^3-5*x.^2+4*x-7;
f2 = @(x) 1+0*x;
y1 = f1(x);
y2 = f2(x);
plot(x,y1,x,y2)

%Menggambar sumbu x dan y
line([-0.5,3],[0,0]) %Sumbu X
line([0,0],[-12,24]) %Sumbu Y

%Annotation
text(0.0,-9,'y_1 = 3x^3-5x^2+4x-7')
text(2.0,-1.8,'y_2 = 1')
text(1.0,10,'Akar')
