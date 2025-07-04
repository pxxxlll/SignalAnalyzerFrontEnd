function Rx = process_i_16bit(RecDataDisp)
%% I路信号
A=reshape(RecDataDisp,2,size(RecDataDisp,1)/2); 
A=A(:,9:end);
%取奇数列和偶数列
num_cols=size(A,2);
odd_A=A(:,1:2:num_cols);
even_A=A(:,2:2:num_cols);
%按一行排列
I_1=reshape(odd_A,1,2*size(odd_A,2));
Q_1=reshape(even_A,1,2*size(even_A,2));
%提取一个字节的前四位和后四位
i=size(I_1,2);
M=zeros(1,i);
L=zeros(1,i);
for m=1:i
    M(1,m)=bitshift(bitand(I_1(1,m),240),-4);
    L(1,m)=bitand(I_1(1,m),15);
end
%组合高四位和低四位
I_2=[M;L];
I_2=reshape(I_2,4,size(I_2,2)/2);
%得到整理好的有符号数
I=[I_2(3,:);I_2(4,:);I_2(1,:);I_2(2,:)];
I=I(1,:)*4096+I(2,:)*256+I(3,:)*16+I(4,:);
%得到有符号数的值
i=size(I,2);
for n=1:i
    if I(1,n) >= 32768
       I(1,n)=I(1,n)-65536;
    end
end
%处理Q

q_i=size(Q_1,2);
q_M=zeros(1,q_i);
q_L=zeros(1,q_i);
for m=1:q_i
    q_M(1,m)=bitshift(bitand(Q_1(1,m),240),-4);
    q_L(1,m)=bitand(Q_1(1,m),15);
end
%组合高四位和低四位
Q_2=[q_M;q_L];
Q_2=reshape(Q_2,4,size(Q_2,2)/2);
%得到整理好的有符号数
Q=[Q_2(3,:);Q_2(4,:);Q_2(1,:);Q_2(2,:)];
Q = Q(1,:)*4096+Q(2,:)*256+Q(3,:)*16+Q(4,:);
%得到有符号数的值
q_i = size(Q,2);
for n=1:q_i
    if Q(1,n)>=32768
       Q(1,n)=Q(1,n)-65536;
    end
end

Rx = I + j*Q;
end