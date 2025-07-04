% pseudo TCP_receiver
% replace this with a true TCP receiver when develop is done.
function [] = demo_gui_process(app)
% TCP parameters initilazation
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
Rs = [1,3,7,15,31];


% main loop
while true
    switch app.STATE
        case demo_gui_state.IDLE
            % do nothing

        case demo_gui_state.CONN
            % try connecting TCP
            %********************************************************************************************************************
            %建立服务器连接远程主机，本地服务器IP地址192.168.137.209，端口号5001。客户端IP地址为192.168.137.10，端口号为52433
            % t = tcpip('192.168.137.10',5001,'NetworkRole','server');
            % t.InputBuffersize=long;%**********设置最大缓冲区，一次最多接收数据为long个字节。
            % fopen(t);%打开服务器，直到建立一个TCP连接才返回；
            % app.TCP_OK = true;
            % flushoutput(t);
            % data1 = [0xAA, 0x55, 0xFF, 0xA0];%发送开始帧，开始数据收取
            % fwrite(t, data1,'uint8')
            % pause(1);
            % RecDataDisp=fread(t,t.BytesAvailable);%从缓冲区读取数字节数据
            % t.ValuesReceived %显示接收到的数据个数
            % data2 = [0xAA, 0x55, 0xFF, 0xB1];%暂停数据收取
            % fwrite(t, data2,'uint8');
            %**************************************************************************************************

            % Pseudo TCP connection
            if ~app.TCP_OK % if TCP not connected, connect it
                app.TCP_OK = true;
                app.StatusLamp.Color = [0, 1, 0];
                pseudo_TCP_rec = load("RecDataDisp.mat", '-mat');
                RecDataDisp = pseudo_TCP_rec.RecDataDisp;
            end
        case demo_gui_state.RUN
            % data processing and plot
            process_i_16bit; %对原始数据的I路进行处理，处理过后的数据长度为（long-16）/4，数组名为I。
            if size(I,2)==(long-16)/4         %*********根据收取的数据长度改变
                for m=1:(long-16)/4/128        %*********根据收取的数据长度改变
                    for i=1:128   %更新数据并绘图
                        RecDataDisp1(AxisValue+i-1) = I(Value+i-1);
                        Axis(AxisValue+i-1) = AxisValue+i-1;
                    end
                    % subplot(2,1,1);%128个数据绘制一次I路信号
                    if AxisValue > 128
                        xlim(app.IRecWfm, [Axis(AxisValue-128), Axis(AxisValue-1)]);
%                         ISpec = abs(fft(RecDataDisp1(AxisValue-128:AxisValue-1)));
                        plot(app.IRecWfm, Axis(AxisValue-128:AxisValue-1), RecDataDisp1(AxisValue-128:AxisValue-1), 'r');
%                         plot(app.IRecSpec, Axis(AxisValue-128:AxisValue-1), ISpec);
                    end
                    AxisValue = AxisValue+128;
                    Value = Value + 128;
                    window = window + 128;
                    %                 axis(app.IRecWfm, [window, window + window_width, AxisMin, AxisMax]);
                    %                 grid on;
                    % title('I路数据接收');
                    % xlabel('n');
                    % ylabel('幅度');
%                     drawnow
                end
            end
            process_q_16bit; %对原始数据的Q路进行处理，数组名为Q。
            if size(Q,2)==(long-16)/4    %*********根据收取的数据长度改变
                for m=1:(long-16)/4/128       %*********根据收取的数据长度改变
                    for i=1:128   %更新数据并绘图
                        RecDataDisp2(AxisValue2+i-1) = Q(Value2+i-1);
                        Axis2(AxisValue2+i-1) = AxisValue2+i-1;
                    end
                    % subplot(2,1,2);%128个数据绘制一次Q路信号
                    if AxisValue2 > 128
                        xlim(app.QRecWfm, [Axis2(AxisValue2-128), Axis2(AxisValue2-1)]);
%                         QRecSpec = abs(fft(RecDataDisp2(AxisValue2-128:AxisValue2-1)));
                        plot(app.QRecWfm, Axis2(AxisValue2-128:AxisValue2-1), RecDataDisp2(AxisValue2-128:AxisValue2-1), 'r');
%                         plot(app.QRecSpec, Axis2(AxisValue2-128:AxisValue2-1), QRecSpec);
%                         disp([Axis2(AxisValue2-128), Axis2(AxisValue2-1)]);
%                         disp(Axis2(AxisValue2-128) - Axis2(AxisValue2-1))
                    end
                    AxisValue2 = AxisValue2+128;
                    Value2 = Value2 + 128;
                    window2 = window2 + 128;
                    %                 axis(app.QrecWfm, [window2, window2 + window_width, AxisMin, AxisMax]);
                    %                 grid on;
                    % title('Q路数据接收');
                    % xlabel('n');
                    % ylabel('幅度');
%                     drawnow
                end
            end

            Value = 1;
            Value2 = 1;
            RecData(1,1+fig*size(I,2):size(I,2)+fig*size(I,2)) = I(1:end); %存储所有读取到的数据
            RecData(2,1+fig*size(Q,2):size(Q,2)+fig*size(Q,2)) = Q(1:end);
            %-----------------------------'---------
            IQ = I + 1j * Q;
            IQSpec = abs(fftshift(fft(IQ,4096)));
            xlim(app.IQSpec, "tight")
            stem(app.IQSpec, IQSpec);
%             figure;
            plot(app.CstDiag, IQ,'.')
%             title('星座图')
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
%             pseudo_evm = load('./evm.mat', '-mat');
%             evm = pseudo_evm.evm;
            %生成调制方式对应星座点
            Bits = randi([0 nqam(idx)-1],length(IQ),1)';
            data = qammod(Bits,nqam(idx),'UnitAveragePower',true);
%             pseudo_data = load("data.mat", '-mat');
%             data = pseudo_data.data;
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
            
            app.ModulationTypeTextArea.Value = QAM_type;
            app.EVMTextArea.Value = num2str(EVM_percent);
            app.GainIQImbalanceTextArea.Value = num2str(gain_imbalance);
            app.PhaseImbalanceTextArea.Value = num2str(phi_deg);


    end

    pause(0.5); % This pause is necessary for state change detection

end
end




