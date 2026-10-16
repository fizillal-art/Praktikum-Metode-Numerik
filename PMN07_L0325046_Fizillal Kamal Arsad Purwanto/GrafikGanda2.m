%Plot Kurva
x = linspace(-1.8,2.5);
f1 = @(x) exp(x);
f2 = @(x) x.^2;
y1 = f1(x);
y2 = f2(x);
plot(x,y1,x,y2)

%Menggambar sumbu x dan y
line([-2,3],[0,0]) %Sumbu X
line([0,0],[-1,12]) %Sumbu Y

%Annotation
text(1.2,3.6,'y_1 = e^x')
text(-1.8,3.8,'y_2 = x^2')
text(-1.8,7,'Akar')
