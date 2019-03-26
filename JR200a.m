clear all;
A=[-1 -0.7;0.8 0.5]
b=[2 ; 1.5]
cT=[-0.8 0.6]
d=1.8

E = eye(2,2); % 2x2 E
L=poly(A);

lambda = roots(L)

Lagr_1 = (A-lambda(2)*E)/(lambda(1)-lambda(2))  %L1 Lagrange mátrix
Lagr_2 = (A-lambda(1)*E)/(lambda(2)-lambda(1))  %L2 Lagrange mátrix

sys = ss(A,b,cT,d);

% t=(0:0.1:2)';

[h,t]=impulse(sys,20);

for hindx=1:size(t)
    h1(hindx)=cT*Lagr_1*b*exp(lambda(1)*t(hindx))+...
        cT*Lagr_2*b*exp(lambda(2)*t(hindx));
end
    
figure;
plot(t,h,'b','LineWidth',3);
hold on;
plot(t,h1,'r','LineWidth',3);
grid on

%s1=lsim(sys,u,t);