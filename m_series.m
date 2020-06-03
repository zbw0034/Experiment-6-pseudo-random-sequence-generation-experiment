function [M]=m_series(A,initial_state)
%M为产生的m序列；A为生成多项式；initial_state为寄存器初始状态
 
n=length(initial_state);
T=2^n-1;
A0=A(end-1:-1:1);
 
temp=initial_state;M=[];
for i=1:T
    M=[M temp(n)];%记录输出序列
    M_current=mod(sum(A0.*temp),2);%生成第一个寄存器的信号
    M_current=[M_current temp(1:n-1)];%第2~n个寄存器的信号，分别是上一时刻第1~n-1个寄存器的信号
    temp=M_current;
end 
M=M*2-1;%双极性码



