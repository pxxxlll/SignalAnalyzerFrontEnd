%% ��ȡ����
t.InputBuffersize=long;  %*********������ȡ�����ݳ��ȸı�
flushinput(t);
fwrite(t, data1,'uint8')
pause(1);
RecDataDisp=fread(t,t.BytesAvailable);%�ӻ�������ȡ��������
t.ValuesReceived %��ʾ���յ������ݸ���
fwrite(t, data2,'uint8');





    
    