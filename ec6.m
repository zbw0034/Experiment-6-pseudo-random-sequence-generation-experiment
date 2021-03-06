clc;clear all;
A1=[1,0,0,1,0,1];%
A2=[1,1,1,1,0,1];
initial_state=[0,0,0,0,1];
M1=m_series(A1,initial_state);
M2=m_series(A2,initial_state);
figure(1)
subplot(2,1,1);
stairs([M1,M1])
axis([0,124,-0.5,1.5])
title('本原多项式为（45）8')
subplot(2,1,2);
stairs([M2,M2])
axis([0,124,-0.5,1.5])
title('本原多项式为（75）8')
%自相关
R1=ec6_circshift(M1);
R2=ec6_circshift(M2);
figure(2)
subplot(2,1,1);
plot(R1)
axis([0,124,-0.2,1.2])
title('本原多项式为（45）8自相关函数')
subplot(2,1,2);
plot(R2)
axis([0,124,-0.2,1.2])
title('本原多项式为（75）8自相关函数')
%互相关
N=length(M1);
Mn1=zeros(1,2*N);
Mn2=zeros(1,2*N);
R=zeros(1,2*N);
for i=1:2*N
    %互相关函数
   % Mn1=circshift(M1,i);
    Mn2=circshift(M2,i);
    A(1,i)=sum(M1==Mn2);
    D=N-A(1,i);
    R(1,i)=(A(1,i)-D)/N;
end
figure(3)
plot(R)
axis([0,124,-0.5,0.5])
title('互相关函数')
