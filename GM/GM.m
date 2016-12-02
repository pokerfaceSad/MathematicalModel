%GM
   
clear all
close all
clc

load data

x1(1) = x0(1);
for i = 2:max(size(x0))
       x1(i) = x1(i-1) + x0(i) ;
end

for i = 1:(max(size(x0))-1)
        B(i,:) = [-1/2 * ( x1(i) + x1(i+1))  1];
end

for i = 1:(max(size(x0))-1)
        Y(i,:) = [x0(i+1)];
end

u = (inv(B'*B)) * B' * Y;
a = u(1);
b = u(2);

x1_(1) = x0(1);
x0_(1) = x0(1);

%K的上限为要预测的代数
for K = 1:17
    x1_(K+1) = (x0(1) - b/a)*exp(-a*K) + b/a;
end

%K的上限为要预测的代数
for K = 1:17
    x0_(K+1) = x1_(K+1) - x1_(K);
end