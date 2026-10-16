%Plot Kurva
x = linspace(-1.95,2.5);
f = @(x) log(x+2)+2*x-3;
y = f(x);
plot(x,y)

%Menggambar sumbu x dan y
line([-2,3],[0,0]) %Sumbu X
line([0,0],[-8,6]) %Sumbu Y

%Annotation
text(0.6,-6.5,'y = log(x+2)+2x-3')
text(0.1,-4,'Akar')
