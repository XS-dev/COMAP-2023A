function y = stable_transition2(t, A1, A2, f, d)
% t: 时间向量
% A1: 初始振幅（较大的稳定态）
% A2: 最终振幅（较低的稳定态）
% f: 正弦函数频率
% d: 振荡衰减速率

% 计算每个时间点上的振幅
y = (A1 - A2) * exp(-d * t) .* sin(2 * pi * f * t) + A2+t./2;
end

