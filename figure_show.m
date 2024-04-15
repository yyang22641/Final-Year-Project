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

% figure;
% imagesc(Bscan5);
% colormap('gray'); 
% title('Bscan5');
% colorbar;
% xlabel('Y axis');
% ylabel('Z axis');


% 假定 Bscan1 到 Bscan5 是已经加载到 MATLAB 工作空间中的图像变量

% 假定 Bscan1 到 Bscan5 是已经加载到 MATLAB 工作空间中的图像变量

% 创建新的图形窗口
figure;

Bscan_show_1 = 20*log10(Bscan1);
Bscan_show_2 = 20*log10(Bscan2);
Bscan_show_3 = 20*log10(Bscan3);
Bscan_show_4 = 20*log10(Bscan4);
Bscan_show_5 = 20*log10(Bscan5);

h1 = plot(Bscan_show_1(190,:), 'DisplayName', 'Bscan1');
hold on; 
h2 = plot(Bscan_show_2(190,:), 'DisplayName', 'Bscan2');
h3 = plot(Bscan_show_3(190,:), 'DisplayName', 'Bscan3');
h4 = plot(Bscan_show_4(190,:), 'DisplayName', 'Bscan4');
h5 = plot(Bscan_show_5(190,:), 'DisplayName', 'Bscan5');

% 添加图例
lgd = legend([h1, h2, h3, h4, h5]);
title(lgd,'Click to toggle B-scan');
% 设置图例项与数据系列的交互
set(lgd, 'ItemHitFcn', @legendToggle);

% 添加标题和坐标轴标签
title('Pixel Intensity Profile at y=150 for Bscan1 to Bscan5');
xlabel('y axis');
ylabel('Pixel Intensity');

% 移除 hold on 状态
hold off;

% 交互式图例回调函数
function legendToggle(src, event)
    % 获取点击的图例项
    item = event.Peer;
    % 切换可见性
    if strcmp(item.Visible, 'on')
        item.Visible = 'off';
    else
        item.Visible = 'on';
    end
end

% 创建新的图形窗口
% figure;
% 
% Bscan_figure_1 = 20*log(Bscan_ori_1);
% Bscan_figure_2 = 20*log(X1);
% Bscan_figure_3 = 20*log(Xrec1);
% h1 = plot(Bscan_figure_1(100,:), 'DisplayName', 'Bscan1_{original}');
% hold on; 
% h2 = plot(Bscan_figure_2(100,:), 'DisplayName', 'Bscan1_{denosing}');
% h3 = plot(Bscan_figure_3(100,:), 'DisplayName', 'Bscan1_{denosingplus}');
% 
% 
% 添加图例
% lgd = legend([h1, h2, h3]);
% title(lgd,'Click to toggle B-scan');
% 设置图例项与数据系列的交互
% set(lgd, 'ItemHitFcn', @legendToggle);
% 
% 添加标题和坐标轴标签
% title('Pixel Intensity Profile at y=150 for Bscan1');
% xlabel('z axis');
% ylabel('Pixel Intensity');
% xlim([0 550]);
% 
% 移除 hold on 状态
% hold off;
% 
% 交互式图例回调函数
% function legendToggle(src, event)
%     获取点击的图例项
%     item = event.Peer;
%     切换可见性
%     if strcmp(item.Visible, 'on')
%         item.Visible = 'off';
%     else
%         item.Visible = 'on';
%     end
% end


% figure;
% imagesc(Bscan1);
% colormap('gray'); 
% title('Bscan1');
% xlabel('Y axis');
% ylabel('Z axis');
% 
% figure;
% imagesc(Bscan2);
% colormap('gray'); 
% title('Bscan2');
% xlabel('Y axis');
% ylabel('Z axis');
% 
% figure;
% imagesc(Bscan3);
% colormap('gray'); 
% title('Bscan3');
% xlabel('Y axis');
% ylabel('Z axis');
% 
% figure;
% imagesc(Bscan4);
% colormap('gray'); 
% title('Bscan4');
% xlabel('Y axis');
% ylabel('Z axis');
% 
% figure;
% imagesc(Bscan5);
% colormap('gray'); 
% title('Bscan5');
% xlabel('Y axis');
% ylabel('Z axis');

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
% imagesc(20*log10(Bscan_ori_3'));
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

