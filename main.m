% 清除环境变量
clear all;

% 加载数据
load('OCTimage.mat');

% 切割数据集
OCTamp1 = OCTamp(:, 1:300, :);
OCTamp2 = OCTamp(:, 301:600, :);
OCTamp3 = OCTamp(:, 601:900, :);
OCTamp4 = OCTamp(:, 901:1200, :);
OCTamp5 = OCTamp(:, 1201:1500, :);
Bscan_ori_1 = squeeze(OCTamp1(150, :, :));
Bscan_ori_2 = squeeze(OCTamp2(150, :, :));
Bscan_ori_3 = squeeze(OCTamp3(150, :, :));
Bscan_ori_4 = squeeze(OCTamp4(150, :, :));
Bscan_ori_5 = squeeze(OCTamp5(150, :, :));

% 归一化数据集
Bscan1_noise = double(Bscan_ori_1);
minVal = min(Bscan1_noise(:));
maxVal = max(Bscan1_noise(:));
Bscan1_noise = (Bscan1_noise - minVal) / (maxVal - minVal); % 归一化处理

% 
% %判断噪声
% % 选择一个切片进行噪声分析
% slice = Bscan1_noise;
% edgeRegion = slice(1:200,1:200);
% % 计算并显示选定区域的直方图
% figure;
% imhist(edgeRegion,256);
% title('Histogram in the area')

% 根据直方图判断噪声类型

% % 
% figure;
% imagesc(Bscan_ori_1);
% colormap('gray'); 
% title('Bscan1');
% xlabel('Y axis');
% ylabel('Z axis');
% % 
% 
% figure;
% imagesc(20*log10(Bscan_ori_2'));
% colormap('gray'); 
% title('Bscan2');
% xlabel('Y axis');
% ylabel('Z axis');
% 
% figure;
% imagesc(Bscan_ori_3');
% colormap('gray'); 
% title('Bscan3');
% xlabel('Y axis');
% ylabel('Z axis');
% 
% 
% figure;
% imagesc(20*log10(Bscan_ori_4'));
% colormap('gray'); 
% title('Bscan4');
% xlabel('Y axis');
% ylabel('Z axis');
% 
% 
% figure;
% imagesc(20*log10(Bscan_ori_5'));
% colormap('gray'); 
% title('Bscan5');
% xlabel('Y axis');
% ylabel('Z axis');



% %初始化存储预处理后图像的变量
% OCTamp_processed = cell(5,1);
% Bscans = cell(5,1);
% 
% for i = 1:5
%     %选择当前OCTamp数据
%     currentOCTamp = eval(['OCTamp' num2str(i)]);
%     
%     %滤波以去除噪声，这里使用高斯滤波
%     filterSize = [3 3];  % 滤波器大小
%     sigma = 1;  % 高斯滤波器的标准差
%     gaussianFilter = fspecial('gaussian', filterSize, sigma);
%     filteredOCTamp = imfilter(currentOCTamp, gaussianFilter, 'replicate');
%     Bscans{i} = squeeze(filteredOCTamp(150, :, :));
%    
% end

% 提取x等于150时的B-scan
% Bscan1 = Bscans{1};
% Bscan2 = Bscans{2};
% Bscan3 = Bscans{3};
% Bscan4 = Bscans{4};
% Bscan5 = Bscans{5};

% figure;
% imagesc(20*log10(Bscan1'));
% colormap('gray'); 
% title('Bscan1');
% xlabel('Y axis');
% ylabel('Z axis');
% 
% figure;
% imagesc(20*log10(Bscan2'));
% colormap('gray'); 
% title('Bscan2');
% xlabel('Y axis');
% ylabel('Z axis');
% 
% figure;
% imagesc(20*log10(Bscan3'));
% colormap('gray'); 
% title('Bscan3');
% xlabel('Y axis');
% ylabel('Z axis');
% 
% figure;
% imagesc(20*log10(Bscan4'));
% colormap('gray'); 
% title('Bscan4');
% xlabel('Y axis');
% ylabel('Z axis');
% 
% figure;
% imagesc(20*log10(Bscan5'));
% colormap('gray'); 
% title('Bscan5');
% xlabel('Y axis');
% ylabel('Z axis');










