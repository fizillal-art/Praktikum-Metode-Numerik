%Plot Kurva
x = linspace(-1.5,2.5);
f = @(x) exp(x)-x.^2;
y = f(x);
plot(x,y)

%Menggambar sumbu x dan y
line([-2,3],[0,0]) %Sumbu X
line([0,0],[-4,12]) %Sumbu Y

%Annotation
text(0.6,-2.6,'y = e^x-x^2')
text(-1.6,2.5,'Akar')
