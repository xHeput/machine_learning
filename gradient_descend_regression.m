clear all
close all
clc

num_elements=50;
a=-2;
b=5;
c=7;
x=1:1:num_elements;
y=a*x+b*randn(1,num_elements);
y=y+c;

Y=y';
X=x';

X=[ones(size(X)) X];

A=randn(2,1);
alfa=0.00001;
num_iteration=50;

figure(1);
grid on;
hold on;

figure(2);
grid on;
hold on;

% gradient descend regression
for i=1:1:num_iteration

    beta = 0.001 * (length(X)/(1.0+(i*length(X))));
    
    figure(1)
    plot(i,beta,'or')

    for n_data = 1:length(X)
        ye = X(n_data,:) * A;
        e = (Y(n_data,:)-ye);
        D_A = beta * e * X(n_data,:)';
        A = A + D_A;
    end

    ye=X*A;
    e_num = mse(Y,ye);

    figure(2);
    plot(i,e_num,'*m')
end


figure(3)

plot(x, y, 'o');grid on;hold on;
xlabel('x');
ylabel('y');

y_regression = A(2) * x + A(1);
plot(x, y_regression, 'r', 'LineWidth', 2);
