%约束条件g5
function g = g5(x)
%全局变量
P = 6000;
L = 14;
G = 12*10^6;
E = 30*10^6;
R = sqrt( x(2)^2/4 + ((x(1)+x(3))/2)^2 );
M =  P*(L+x(2)/2);
D = 6*P*L/(x(4)*x(3)^2);
o = 4*P*(L^3) / (E*(x(3)^3)*x(4));
Pc = 4.013*E*sqrt((x(3)^2 * x(4)^6)/36)/(L^2)*(1-x(3)/(2*L)*sqrt(E/(4*G)));
J = 2*( sqrt(2)*x(1)*x(2) * ( (x(2)^2/12) +(x(1)+x(3)/2)^2));
t1 = P/(sqrt(2)*x(1)*x(2));
t2 = M*R/J;

    g = 0.125-x(1);
end