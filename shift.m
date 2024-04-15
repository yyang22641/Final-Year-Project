% Bscan1_mov = circshift(Bscan1, [0, 0]);
% Bscan2_mov = circshift(Bscan2, [0, 0]);
% Bscan3_mov = circshift(Bscan3, [0, -1]);
% Bscan4_mov = circshift(Bscan4, [0, -3]);
% Bscan5_mov = circshift(Bscan5, [0, -4]);

% 设定目标dB级
target_dB = -20;

% Bscans数组包含了所有B-scan的数据
Bscans = {Bscan1, Bscan2, Bscan3, Bscan4, Bscan5};

% 为每个B-scan的每一行计算偏移量
offsets = zeros(size(Bscans{1}, 1), length(Bscans)); % 初始化偏移量矩阵
for i = 1:length(Bscans)
    for row = 1:size(Bscans{i}, 1)
        dB_values = 20*log10(abs(Bscans{i}(row, :)));
        idx = find(dB_values >= target_dB, 1, 'first');
        if ~isempty(idx)
            y_values_at_target_dB(row) = idx;
        else
            y_values_at_target_dB(row) = NaN; % 如果没有达到，则设置为NaN
        end

        % 逐行计算最佳偏移量
        max_corr = -Inf;
        for offset = -20:20  % 假设偏移量范围在-20到20之间
            shifted = circshift(Bscans{i}(row, :), [0, offset]);
            corr_value = corr2(Bscans{1}(row, :), shifted);  % 与Bscan1的相应行比较
            if corr_value > max_corr
                max_corr = corr_value;
                offsets(row, i) = offset;
            end
        end
    end
end

% 应用计算出的偏移量进行逐行对齐
aligned_Bscans = cell(1, 5);
for i = 1:length(Bscans)
    aligned_Bscans{i} = Bscans{i};
    for row = 1:size(Bscans{i}, 1)
        if ~isnan(offsets(row, i))
            aligned_Bscans{i}(row, :) = circshift(Bscans{i}(row, :), [0, offsets(row, i)]);
        end
    end
end

Bscan1 = aligned_Bscans{1};
Bscan2 = aligned_Bscans{2};
Bscan3 = aligned_Bscans{3};
Bscan4 = aligned_Bscans{4};
Bscan5 = aligned_Bscans{5};

clear offset offsets row shifted max_corr idx i corr_value dB_values target_dB y_values_at_target_dB


% figure;
% imagesc(20*log10(Bscan1_mov'));
% colormap('gray'); 
% title('Bscan1');
% xlabel('Y axis');
% ylabel('Z axis');
% 
% figure;
% imagesc(20*log10(Bscan2_mov'));
% colormap('gray'); 
% title('Bscan2');
% xlabel('Y axis');
% ylabel('Z axis');
% 
% figure;
% imagesc(20*log10(Bscan3_mov'));
% colormap('gray'); 
% title('Bscan3');
% xlabel('Y axis');
% ylabel('Z axis');
% 
% figure;
% imagesc(20*log10(Bscan4_mov'));
% colormap('gray'); 
% title('Bscan4');
% xlabel('Y axis');
% ylabel('Z axis');
% 
% figure;
% imagesc(20*log10(Bscan5_mov'));
% colormap('gray'); 
% title('Bscan5');
% xlabel('Y axis');
% ylabel('Z axis');
