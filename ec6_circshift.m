function [R]=ec6_circshift(M)
N=length(M);
R=zeros(1,2*N);
for i=1:2*N
    %自相关函数
    Mn=circshift(M,i);
    A=sum(Mn==M);
    D=N-A;
    R(1,i)=(A-D)/N;
end