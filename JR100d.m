clear all;
L=300;
h=zeros(L+1,1);
u=zeros(L+1,1);
for k=0:L
    h(k+1)=6*(0.4)^k*cos(0.3*k+0.5);
    u(k+1)=2;
end
conv(h,u)
