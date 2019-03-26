clear all;
K=10;
B=2;
m=1000;

A=[0 1;-K/m -B/m]
b=[0 ; 1/m]
cT=[1 0]
d=0

E = eye(2,2); % 2x2 E
L=poly(A);

lambda = roots(L)

Lagr_1 = (A-lambda(2)*E)/(lambda(1)-lambda(2))  %L1 Lagrange mátrix
Lagr_2 = (A-lambda(1)*E)/(lambda(2)-lambda(1))  %L2 Lagrange mátrix

sys = ss(A,b,cT,d);

[h,t]=impulse(sys);
[e,te]=step(sys);
    

xmax=5000;
subplot(2,1,1)
plot(t,h,'b','LineWidth',3)
title('Impulzusválasz')
xlim([0 xmax]);
grid on;

subplot(2,1,2)
plot(te,e,'b','LineWidth',3)
title('Ugrásválasz')
xlim([0 xmax]);

grid on;


