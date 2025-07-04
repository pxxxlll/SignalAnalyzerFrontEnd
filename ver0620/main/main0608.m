clear
AxisMax =3000;%最大幅值
AxisMin = -3000;%最小幅值
window_width = 400; %横轴宽度
AxisValue = 1;
Value = 1;
AxisValue2 = 1;
Value2 = 1;
fig=0;
long = 32784;  %long等于原始数据+16字节的头，4个字节的原始数据代表一位真实数据
RecDataDisp1 = zeros(1,128);%开辟128个数据单元用于存储画图一次所需点数。
RecDataDisp2 = zeros(1,128);
RecDataDisp = zeros(1,long); %***********开辟long个数据单元，用于存储从9631读取一次读到的原始数据。
RecData = zeros(2,100); %用于存储最终的数据，便于写入文件。
Axis = zeros(1,100000); %开辟100000个数据单元，用于存储横轴点数。
Axis2 = zeros(1,100000);
window = window_width * (-0.9);
window2 = window_width * (-0.9);
Rs = [1,3,7,15,31];%用于调制识别的标准Rs
%********************************************************************************************************************
%建立服务器连接远程主机，本地服务器IP地址192.168.137.209，端口号5001。客户端IP地址为192.168.137.10，端口号为52433
t = tcpip('192.168.137.10',5001,'NetworkRole','server');
t.InputBuffersize=long;%**********设置最大缓冲区，一次最多接收数据为long个字节。
fopen(t);%打开服务器，直到建立一个TCP连接才返回；
flushoutput(t);
data1 = [0xAA, 0x55, 0xFF, 0xA0];%发送开始帧，开始数据收取
fwrite(t, data1,'uint8')
pause(1);
RecDataDisp=fread(t,t.BytesAvailable);%从缓冲区读取数字节数据
t.ValuesReceived %显示接收到的数据个数
data2 = [0xAA, 0x55, 0xFF, 0xB1];%暂停数据收取
fwrite(t, data2,'uint8');
%**************************************************************************************************
%接收一次数据后进行绘图，绘图完成后再接收一次数据，重复此过程
while(1)
    Rx = process_i_16bit(RecDataDisp); %对原始数据的I路进行处理，处理过后的数据长度为（long-16）/4，数组名为I。
    I = real(Rx);
    Q = imag(Rx);
    if size(I,2)==(long-16)/4         %*********根据收取的数据长度改变
        for m=1:(long-16)/4/128        %*********根据收取的数据长度改变
            for i=1:128   %更新数据并绘图
                RecDataDisp1(AxisValue+i-1) = I(Value+i-1);
                Axis(AxisValue+i-1) = AxisValue+i-1;
            end
            subplot(2,1,1);%128个数据绘制一次I路信号
            plot(Axis(1:AxisValue-1), RecDataDisp1(1:AxisValue-1), 'r');
            AxisValue = AxisValue+128;
            Value = Value + 128;
            window = window + 128;
            axis([window, window + window_width, AxisMin, AxisMax]);
            grid on;
            title('I路数据接收');
            xlabel('n');
            ylabel('幅度');
            drawnow
        end
    end
%     process_q_16bit; %对原始数据的Q路进行处理，数组名为Q。
    if size(Q,2)==(long-16)/4    %*********根据收取的数据长度改变
        for m=1:(long-16)/4/128       %*********根据收取的数据长度改变
            for i=1:128   %更新数据并绘图
                RecDataDisp2(AxisValue2+i-1) = Q(Value2+i-1);
                Axis2(AxisValue2+i-1) = AxisValue2+i-1;
            end
            subplot(2,1,2);%128个数据绘制一次Q路信号
            plot(Axis2(1:AxisValue2-1), RecDataDisp2(1:AxisValue2-1), 'r');
            AxisValue2 = AxisValue2+128;
            Value2 = Value2 + 128;
            window2 = window2 + 128;
            axis([window2, window2 + window_width, AxisMin, AxisMax]);
            grid on;
            title('Q路数据接收');
            xlabel('n');
            ylabel('幅度');
            drawnow
        end
    end
    Value = 1;
    Value2 = 1;
    RecData(1,1+fig*size(I,2):size(I,2)+fig*size(I,2)) = I(1:end); %存储所有读取到的数据
    RecData(2,1+fig*size(Q,2):size(Q,2)+fig*size(Q,2)) = Q(1:end);
    %--------------------------------------
    IQ = I + 1j * Q;
    figure;
    plot(IQ,'.')
    title('星座图')
    %绘制频谱
    rx_up = upsample(IQ, 2);
    h = rcosdesign(0.35, 8, 8); % 原匹配滤波器
    rx_interp = conv(rx_up, h, 'same'); % 插值重建信号
    % 绘频谱
    fs = 8e6;
    N = length(rx_interp);
    rx_fft = fftshift(fft(rx_interp, 2^nextpow2(N)));
    f = linspace(-fs/2, fs/2, length(rx_fft));
    figure;
    plot(f/1e6, 20*log10(abs(rx_fft)/max(abs(rx_fft))));
    xlabel('Frequency (MHz)');
    ylabel('Magnitude (dB)');
    title('Interpolated Spectrum (to detect out-of-band leakage)');
    grid on;
%     figure;
%     plot(abs(fft(IQ(1:128))))
    %检测复杂调制方式
    nnqam = {'QPSK','QAM16','QAM64','QAM256','QAM1024'};
    nqam = [4,16,64,256,1024];
    radii = abs(IQ); % 聚类中心到原点的距离
    r_max = mean(maxk(radii, 2)); % 最大半径的均值
    r_min = mean(mink(radii, 2)); % 最小半径的均值
    R = r_max / r_min;
    d = abs(Rs-R);
    [~,idx]= min(d);
    QAM_type = nnqam{idx};%输出QAM_type
    %求解EVM
    evm = comm.EVM;
    %生成调制方式对应星座点
    Bits = randi([0 nqam(idx)-1],length(IQ),1)';
    data = qammod(Bits,nqam(idx),'UnitAveragePower',true);
    IQ = IQ/rms(IQ);
    ideal_IQ = zeros(size(IQ));
    for k = 1:length(IQ)
        [~, idx] = min(abs(IQ(k) - data)); % 找到最近的星座点
        ideal_IQ(k) = data(idx);
    end

    evm_vector = IQ - ideal_IQ;
    EVM_rms = sqrt(mean(abs(evm_vector).^2));
    EVM_ref = sqrt(mean(abs(ideal_IQ).^2));
    EVM_percent = (EVM_rms / EVM_ref) * 100;

    fprintf('标准 EVM = %.2f %%\n', EVM_percent);

    %IQ增益不平衡
    gain_I = rms(I); % I分量的均方根
    gain_Q = rms(Q); % Q分量的均方根
    gain_imbalance = 20 * log10(gain_I / gain_Q); % dB
    fprintf('Gain Imbalance = %.2f dB\n', gain_imbalance);
    %IQ相位不平衡
    % 去直流偏移
    I_dc = I - mean(I);
    Q_dc = Q - mean(Q);
    % 估计相位差（方法：相关系数估计）
    phi_rad = acos(dot(I_dc, Q_dc) / (norm(I_dc) * norm(Q_dc)));
    phi_deg = rad2deg(phi_rad) - 90; % 理想值为90°
    fprintf('Phase Imbalance = %.2f degrees\n', phi_deg);
    %--------------------------------------
    fig = fig + 1;
    if fig==1%读取5次数据，总数据长度为(long-16)/4*5
        fclose(t);%结束收取数据
        break
    end
    tcpServer; %重新接收一次数据
end

%将接收到的最终的文件写入文件
fid=fopen('RecData_1.csv','w+','n','utf8');
for i=1:length(RecData)
    fprintf(fid,'%f,%f,\n',RecData(1,i),RecData(2,i));
end
fclose(fid);

%读取数据
% fid = 'RecData_20230912_.csv';
% RecData = readmatrix(fid);
figure;
plot(I,Q,'.b');
