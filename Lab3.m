clear all
clc

x = 0.1:1/22:1;
y = ((1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x))/2;

% Rasti ektremumai
% TF = islocalmax(y);
% plot(x,y,x(TF),y(TF),'r*')

eta = 0.1;
w0 = randn(1);
w1 = randn(1);
w2 = randn(1);

c1 = 0.191;
c2 = 0.918;
r1 = 0.2;
r2 = 0.24;

for j=1:100000
    for i=1:20
        F1 = exp(-((x(i)-c1)^2)/(2*(r1^2)));
        F2 = exp(-((x(i)-c2)^2)/(2*(r2^2)));

        y_is(i)= F1*w1+F2*w2+w0;

        e = y(i)-y_is(i);

        w1 = w1 + eta * e * F1;
        w2 = w2 + eta * e * F2;
        w0 = w0 + eta * e;

    end
end

figure(1)
hold on; grid on;
plot(x, y,"r-*")
plot(x, y_is,"g--* ")
hold off;
legend("Duota","SBF")