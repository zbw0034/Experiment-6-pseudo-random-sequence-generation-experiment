function [M]=m_series(A,initial_state)
%MΪ������m���У�AΪ���ɶ���ʽ��initial_stateΪ�Ĵ�����ʼ״̬
 
n=length(initial_state);
T=2^n-1;
A0=A(end-1:-1:1);
 
temp=initial_state;M=[];
for i=1:T
    M=[M temp(n)];%��¼�������
    M_current=mod(sum(A0.*temp),2);%���ɵ�һ���Ĵ������ź�
    M_current=[M_current temp(1:n-1)];%��2~n���Ĵ������źţ��ֱ�����һʱ�̵�1~n-1���Ĵ������ź�
    temp=M_current;
end 
M=M*2-1;%˫������



