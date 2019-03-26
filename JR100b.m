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
h=impulse(sys,t);
y=lsim(sys,u,t);

y1_=conv(h,u);

y1=y1_(1:21);

figure;
stem(t+0.1,y,'b', 'filled','LineWidth',3);
hold on;
stem(t-0.1,y1,'r', 'filled','LineWidth',3);
grid on

%s1=lsim(sys,u,t);