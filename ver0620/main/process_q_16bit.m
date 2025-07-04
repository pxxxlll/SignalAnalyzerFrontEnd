function Q = process_q_16bit(RecDataDisp)
%% Q路信号
%提取一个字节的前四位和后四位
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
end