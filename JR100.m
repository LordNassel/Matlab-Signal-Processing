clear all;
A=[2 0.8;-4 -1.2]
b=[1 ; -2]
cT=[0.5 2]
d=1

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