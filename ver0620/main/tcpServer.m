%% 读取数据
t.InputBuffersize=long;  %*********根据收取的数据长度改变
flushinput(t);
fwrite(t, data1,'uint8')
pause(1);
RecDataDisp=fread(t,t.BytesAvailable);%从缓冲区读取数字数据
t.ValuesReceived %显示接收到的数据个数
fwrite(t, data2,'uint8');





    
    