clc; clear; close all;

%% 参数配置
M = 256; % QPSK=4, 16QAM=16
N = 1000; % 符号数
timing_offset = 2; % 模拟时钟偏移（单位：采样点）
phase_offset_deg = 30; % 模拟相位偏移（单位：度）
SNR = 25; % 添加的AWGN信噪比（dB）

%% 信号生成
data = randi([0 M-1], N, 1);
modSig = qammod(data, M, 'UnitAveragePower', true); % QPSK 或 16QAM调制

%% 插值上采样（模拟带定时偏移的采样）
sps = 4; % 每符号采样点数
tx_up = upsample(modSig, sps); 
h = rcosdesign(0.35, 4, sps); % 发送滤波器
tx_filt = conv(tx_up, h, 'same'); % 加整形滤波

% 模拟定时偏移（用插值模拟）
tx_offset = interp1(1:length(tx_filt), tx_filt, (1+timing_offset):length(tx_filt), 'linear', 0).';

% 添加相位偏移
phase_offset_rad = deg2rad(phase_offset_deg);
tx_phase = tx_offset .* exp(1j * phase_offset_rad);

% 添加AWGN
rx = awgn(tx_phase, SNR, 'measured');

%% 图1：受定时 & 相位影响后的星座图（抽样后）
rx_down = rx(1:sps:end); % 模拟抽样
figure; scatterplot(rx_down);
title('受同步与相位偏移影响后的星座图');

%% 简单校正：估计并补偿相位
rx_est_phase = angle(mean(rx_down.^M)); % M阶调制估计相位偏移
rx_corr = rx_down .* exp(-1j * rx_est_phase); % 相位校正

%% 图2：校正后的星座图
figure; scatterplot(rx_corr);
title('同步与相位校正后的星座图');

%% 对比：原始调制星座图
figure; scatterplot(modSig);
title('原始理想星座图');

