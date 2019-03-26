clear all;
A=[-0.9233 0.3488; -0.0349 -0.3767]
b=[4.5 ; 7.8]
cT=[-7.3 4.7]
d=12.3

E = eye(2,2); % 2x2 E

L=poly(A)
lambda = roots(L)

lambda(1)
lambda(2)

Lagr_1 = (A-lambda(2)*E)/(lambda(1)-lambda(2))  %L1 Lagrange mátrix
Lagr_2 = (A-lambda(1)*E)/(lambda(2)-lambda(1))  %L2 Lagrange mátrix

sys = ss(A,b,cT,d,1)

t=(0:20)'
u=zeros(21,1)
u(1)=1

h=impulse(sys,t);

h1=zeros(21,1)
for k=0:20
    if (k==0)h1(1)=1;
    end
    if (k>0)h1(k+1)=(-1.75+1i)*(0.4+0.8i)^(k-1)+(-1.75-1i)*(0.4-0.8i)^(k-1);
    end
end
    
figure;
stem(t+0.1,h,'b', 'filled','LineWidth',3);
hold on;
stem(t-0.1,h1,'r','filled','LineWidth',3);
grid on

%s1=lsim(sys,u,t);