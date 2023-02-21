function [k,k1,k2,k3] = kout
%UNTITLED9 此处显示有关此函数的摘要
%   此处显示详细说明
% 设置模拟参数
A1 = 2; % 初始振幅（较大的稳定态）
A2 = 1; % 最终振幅（较低的稳定态）
f1=1;
f = 2; % 震荡频率
d = 0.2; % 震荡衰减速率

t1= 0:0.1:2;
t2 = 2:0.1:4; % 时间向量
t3 = 4:0.1:6;
t4 = 6:0.1:10;

% 计算从一个较大的稳定态转变为一个较低的稳定态的函数
y1= sin(2 * pi * f1 * t1)+5;
y2 =stable_transition(t2, A1, A2, f, d)+6;
y3= stable_transition2(t3, A1, A2, f1, d);
y4= 0.2.*sin(2 * pi * f1 * t4)+4;

t5=0:0.1:10;
y5= sin(2 * pi * f1 * t5)+5;
y6=stable_transition(t5, A1, A2, f, d)+3;
y7=5;

mu = 0;  % 均值
sigma = 0.3;  % 标准差

k=[y1,y2,y3,y4];
noise1 = mu + sigma*randn(size(k));  % 生成高斯噪声
noise = mu + sigma*randn(size(t5));  % 生成高斯噪声
k=(k+noise1)/4;
k1=(y5+noise)/4;
k2=(y6+noise)/4;
k3=(y7+noise)/4;
end

