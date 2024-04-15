% 设定目标dB级
target_dB = -20;

% 初始化数组来存储结果
y_values_at_target_dB = zeros(1, 5);

% 对于每个Bscan计算并存储第一个到达目标dB级的y值
Bscans = {Bscan1, Bscan2, Bscan3, Bscan4, Bscan5};
for i = 1:length(Bscans)
    dB_values = 20*log10(abs(Bscans{i}(100, :)));
    idx = find(dB_values >= target_dB, 1, 'first');
    if ~isempty(idx)
        y_values_at_target_dB(i) = idx;
    else
        y_values_at_target_dB(i) = NaN; % 如果没有达到，则设置为NaN
    end
end

% 打印结果
for i = 1:length(y_values_at_target_dB)
    if ~isnan(y_values_at_target_dB(i))
        fprintf('(y=100)Bscan%d reaches -20 dB first at z = %d\n', i, y_values_at_target_dB(i));
    else
        fprintf('Bscan%d does not reach -20 dB\n', i);
    end
end
