% 归一化数据集
Bscan1 = double(Bscan1); % 转换数据类型为double，以进行准确计算
minVal = min(Bscan1(:));
maxVal = max(Bscan1(:));
Bscan1 = (Bscan1 - minVal) / (maxVal - minVal); % 归一化处理

% 归一化数据集
Bscan2 = double(Bscan2); % 转换数据类型为double，以进行准确计算
minVal = min(Bscan2(:));
maxVal = max(Bscan2(:));
Bscan2 = (Bscan2 - minVal) / (maxVal - minVal); % 归一化处理

% 归一化数据集
Bscan3 = double(Bscan3); % 转换数据类型为double，以进行准确计算
minVal = min(Bscan3(:));
maxVal = max(Bscan3(:));
Bscan3 = (Bscan3 - minVal) / (maxVal - minVal); % 归一化处理

% 归一化数据集
Bscan4 = double(Bscan4); % 转换数据类型为double，以进行准确计算
minVal = min(Bscan4(:));
maxVal = max(Bscan4(:));
Bscan4 = (Bscan4 - minVal) / (maxVal - minVal); % 归一化处理

% 归一化数据集
Bscan5 = double(Bscan5); % 转换数据类型为double，以进行准确计算
minVal = min(Bscan5(:));
maxVal = max(Bscan5(:));
Bscan5 = (Bscan5 - minVal) / (maxVal - minVal); % 归一化处理

clear maxVal minVal i 