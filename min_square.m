clear all
close all
clc
% variables 
num_elements=50;
a=-2;
b=5;
c=7;
x=1:1:num_elements;
y=a*x+randn(1,num_elements);
y=y+c;


Y=y';
X=x';

X=[ones(size(X)) X];


%  metoda najmniejszych kwadratów
xm=sum(x)/length(y);
ym=sum(y)/length(x);

a1=(sum((x-xm).*(y-ym)))./(sum((x-xm).^2));
a0=ym-(a1*xm);

B3=[a0;a1];
ye3=X*B3;

figure(1)

plot(x, y, 'o', LineWidth=3);grid on;hold on;
plot(x, ye3, 'k', LineWidth=3);
xlabel('x');
ylabel('y');

R23=1-sum((y-ye3').^2)/sum((y-mean(y)).^2);