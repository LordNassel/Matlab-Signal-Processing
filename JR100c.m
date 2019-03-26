clear all;
A=[2 0.8;-4 -1.2];
b=[1 ; -2];
cT=[0.5 2];
d=1;

sys = ss(A,b,cT,d,1);
t=(0:20)';
u=zeros(21,1);
for k=0:20
    u(k+1)=-2+7*(-0.9)^k;
end
y=lsim(sys,u,t);

M1=-1.75+1i;
lambda1=0.4+0.8i;

t=(0:20)';
for k=0:20
    y1(k+1)=-2+7*(-0.9)^k;
end
for k=1:20   
    y1(k+1)=y1(k+1)-...
        4*real(M1*(lambda1^(k)-1)/(lambda1-1))+...
        14*(-0.9)^(k)*real(-M1/0.9*((-lambda1/0.9)^(k)-1)/((-lambda1/0.9)-1));
end

figure;
stem(t+0.1,y,'b', 'filled','LineWidth',3);
hold on;
stem(t-0.1,y1,'r', 'filled','LineWidth',3);
grid on
