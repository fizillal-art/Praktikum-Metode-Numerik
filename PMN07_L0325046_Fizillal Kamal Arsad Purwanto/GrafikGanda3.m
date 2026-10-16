%Plot Kurva
x = linspace(-1.95,2.5);
f1 = @(x) log(x+2);
f2 = @(x) -2*x+3;
y1 = f1(x);
y2 = f2(x);
plot(x,y1,x,y2)

%Menggambar sumbu x dan y
line([-2,3],[0,0]) %Sumbu X
line([0,0],[-3,8]) %Sumbu Y

%Annotation
text(1.4,1.6,'y_1 = log(x+2)')
text(-1.5,5.0,'y_2 = -2x+3')
text(1.5,4.5,'Akar')
