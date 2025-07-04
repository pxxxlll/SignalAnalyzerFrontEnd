function [] = demo_gui_process(app)

% app.UIFigure.Position = [100, 100, 1200, 800];  % 左下角 x, y, 宽度, 高度

% constant parameters
% 初始化参数
long = 32784;     % 单次数据长度（含头）
tcp_num_packets = 10;  % 接收帧数
tcp_trans_length = long;
fs = 8e6;
frame_head = [85 170 85 170 85 170 85 170];
% frqPoint = 301:311;
Rs = [1,3,7,15,31]; % 用于调制识别
nnqam = {'QPSK','QAM16','QAM64','QAM256','QAM1024'};
nqam = [4,16,64,256,1024];

ValidEnergyThrehold = 0.1;
ValidSignalMessage = ["No signal.", "Valid signal detected.", "No valid signal detected."];
SIG_NOSIG = 1;
SIG_VALID = 2;
SIG_INVALID = 3;

IQWfmXlimPercentStart = 0.3;
IQWfmXlimPercentEnd = 0.5;

while isvalid(app)
    switch app.STATE
        case demo_gui_state.IDLE
            % Do nothing

        case demo_gui_state.CONN
            if ~app.TCP_OK
                try % try to connect to the server
                    t = tcpip('192.168.137.10',5001,'NetworkRole','server');
                    t.InputBuffersize = long;
                    app.TCP_OK = true;
                catch Exception
                    app.TCP_OK = false;
                    display(Exception.message);
                end
            else
                fopen(t); % open the connection
                flushoutput(t);
                fwrite(t, [0xAA, 0x55, 0xFF, 0xA0], 'uint8'); % 开始命令
                % !!!!! The dimension of these variables would change by
                % iteration, so they must be reset carefully.
                RecDataDisp = [];
                % !!!!!
                tcp_receive_cnt = 0;
                while tcp_receive_cnt < 20
                    if t.BytesAvailable >= tcp_trans_length
                        Recv = fread(t, t.BytesAvailable);
                        RecDataDisp = [RecDataDisp; Recv];
                        tcp_receive_cnt = tcp_receive_cnt + 1;
                    end
                end
                fwrite(t, [0xAA, 0x55, 0xFF, 0xB1], 'uint8'); % 停止命令
                fclose(t);
                app.STATE = demo_gui_state.RUN;
            end

        case demo_gui_state.RUN
            % 同步帧查找
            match_pos = strfind(RecDataDisp(:).', frame_head);
            RecDataFrqPoint = hex2dec(string(dec2hex(uint8(RecDataDisp(match_pos+9)))) + string(dec2hex(uint8(RecDataDisp(match_pos+8)))));
            match_pos_syncStart = find(diff(RecDataFrqPoint)<1)+1;



            if length(match_pos_syncStart)==1
                TrueSyncStart = match_pos(match_pos_syncStart(1):end);
                match_pos_syncStart(2) = length(RecDataFrqPoint);
            else
                match_pos_syncStart(2) =  match_pos_syncStart(2) - 1;
                TrueSyncStart = match_pos(match_pos_syncStart(1):match_pos_syncStart(2));

            end
            %                 TrueSyncStart = match_pos(match_pos_syncStart(1):match_pos_syncStart(1)+tcp_num_packets);

            RecDataIQ = zeros(8192, tcp_num_packets+1);
            EnergyRecData = zeros(tcp_num_packets+1,1);


            S21Data = zeros(tcp_num_packets+1,1);
            % !!!!!
            Spectrum = [];
            %             f = [];
            % !!!!!
            for i = 1:length(TrueSyncStart)
                RecDataSingle = RecDataDisp(TrueSyncStart(i):TrueSyncStart(i)+tcp_trans_length-1);
                RecDataIQ(:,i) = process_i_16bit(RecDataSingle);

                % 能量估计
                EnergyRecData(i) = mean(abs(RecDataIQ(:,i)));

                % 插值重建 + 频谱分析
                rx_up = upsample(RecDataIQ(:,i), 2);
                h = rcosdesign(0.35, 8, 8);
                rx_interp = conv(rx_up, h, 'same');
                N = length(rx_interp);
                rx_fft = mag2db(abs(fftshift(fft(rx_interp, 2^nextpow2(N)))));
                S21Data(i) = rx_fft(8193);
                rx_fft(8193) = [];
                Spectrum = [Spectrum; rx_fft(8192-2048:8192+2048)];
                %                 f = [f, linspace(-fs/2 + frqPoint(i)*1e7, fs/2 + frqPoint(i)*1e7, length(rx_fft))];
            end

            try
                energy_max = max(EnergyRecData);
                energy_sum = sum(EnergyRecData);
                energy_mean_without_max = (energy_sum - energy_max) / (length(EnergyRecData) - 1);
                if energy_mean_without_max / energy_max < ValidEnergyThrehold
                    app.SIGNAL_STATUS = SIG_VALID;
                else
                    app.SIGNAL_STATUS = SIG_INVALID;
                end
                app.NoSignalLabel.Text = ValidSignalMessage(app.SIGNAL_STATUS);
                switch app.SIGNAL_STATUS
                    case SIG_VALID
                        app.SpectrumStatusLamp.Color = [0 1 0]; % green
                    case SIG_INVALID
                        app.SpectrumStatusLamp.Color = [0 0 0]; % black
                    otherwise
                        app.SpectrumStatusLamp.Color = [0.5 0.5 0.5]; % grey
                end
            catch E
                display(E.message);
                pause(0.1)
            end

            % 画 S21 图
            Freq = linspace(RecDataFrqPoint(match_pos_syncStart(1)), RecDataFrqPoint(match_pos_syncStart(2)), length(S21Data))';
            FreqInterp = linspace(RecDataFrqPoint(match_pos_syncStart(1)), RecDataFrqPoint(match_pos_syncStart(2)), 10 * length(S21Data))';
            S21DataInterp = interp1(Freq, S21Data, FreqInterp, 'spline');
            S21DataInterpNoisy = awgn(S21DataInterp, 1);
            app.S21.XLim = [FreqInterp(1) FreqInterp(end)];
            app.S21.YLim = [1 100];
            plot(app.S21, FreqInterp, S21DataInterpNoisy);


            % 画频谱图
            Freq = linspace(RecDataFrqPoint(match_pos_syncStart(1)), RecDataFrqPoint(match_pos_syncStart(2)-1), length(Spectrum))';
            app.Spectrum.XLim = [Freq(1), Freq(end)];
            plot(app.Spectrum, Freq, Spectrum);


            % 星座图 & IQ提取
            [~, idxEnergy] = max(EnergyRecData);
            IQ = RecDataIQ(:, idxEnergy);
            
            %相偏校正
            IQ4=-IQ.^4;
            %ang = mean(angle(z_k)/8);
            ang =(angle(sum(IQ4)))/4;
            %校正后的数据
            IQ=IQ.*exp(-1i*ang);
            threshold = max(abs(IQ))*0.08;
            idxIQ = find(abs(IQ)>threshold);
            idxIQ = idxIQ(5:end);
            IQ = IQ(idxIQ);
            
            try
                IQ_plt_slice_idx = IQWfmXlimPercentStart * length(IQ) : IQWfmXlimPercentEnd * length(IQ);
                IQ_plt_slice_idx = floor(IQ_plt_slice_idx);
                plot(app.IRecWfm, real(IQ(IQ_plt_slice_idx)), 'r');
                plot(app.QRecWfm, imag(IQ(IQ_plt_slice_idx)), 'b');
                plot(app.CstDiag, IQ, '.');
            catch E
                display(E.message);
                pause(0.1);
            end
            % QAM调制类型估计
            radii = abs(IQ);
            r_max = mean(maxk(radii, 50));
            r_min = mean(mink(radii, 50));
            R = r_max / r_min;
            [~, idx] = min(abs(Rs - R));
            QAM_type = nnqam{idx};
            app.ModulationTypeTextArea.Value = QAM_type;

            % EVM估计
            Bits = randi([0 nqam(idx)-1], length(IQ), 1);
            ref_data = qammod(Bits, nqam(idx), 'UnitAveragePower', true);
            IQ_norm = IQ / rms(IQ);
            ideal_IQ = zeros(size(IQ));
            for k = 1:length(IQ)
                [~, closest] = min(abs(IQ_norm(k) - ref_data));
                ideal_IQ(k) = ref_data(closest);
            end
            evm_vector = IQ_norm - ideal_IQ;
            EVM_rms = sqrt(mean(abs(evm_vector).^2));
            EVM_ref = sqrt(mean(abs(ideal_IQ).^2));
            EVM_percent = (EVM_rms / EVM_ref) * 100;
            app.EVMTextArea.Value = num2str(EVM_percent);
            fprintf('EVM = %.2f %%\n', EVM_percent);

            % IQ增益不平衡
            gain_I = rms(real(IQ));
            gain_Q = rms(imag(IQ));
            gain_imbalance = 20 * log10(gain_I / gain_Q);
            fprintf('Gain Imbalance = %.2f dB\n', gain_imbalance);
            app.GainIQImbalanceTextArea.Value = num2str(gain_imbalance);

            % IQ相位不平衡
            I_dc = real(IQ) - mean(real(IQ));
            Q_dc = imag(IQ) - mean(imag(IQ));
            phi_rad = acos(dot(I_dc, Q_dc) / (norm(I_dc) * norm(Q_dc)));
            phi_deg = rad2deg(phi_rad) - 90;
            fprintf('Phase Imbalance = %.2f degrees\n', phi_deg);
            app.PhaseIQImbalanceTextArea.Value = num2str(phi_deg);

            app.STATE = demo_gui_state.CONN; % read the next packet

            try
                if app.SaveDataCheckBox.Value == true
                    [~, ~, ~] = mkdir("PVSA_data");
                    save_timestamp = datetime('now','Format','d-MMM-y--HH_mm_ss');
                    save_name = "./PVSA_data/" + string(save_timestamp) + ".mat";
                    save(save_name, "RecDataIQ");
                end
            catch E
                display(E.message);
                pause(0.1);
            end

    end

    pause(0.5); % 控制更新节奏
end
end
