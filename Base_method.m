% 计算变化图
change_map1 = Bscan2 - Bscan1;
change_map2 = Bscan3 - Bscan2;
change_map3 = Bscan4 - Bscan3;
change_map4 = Bscan5 - Bscan4;

% 可视化变化图
figure; % 创建一个新的图形窗口

% 子图1
subplot(2,2,1); % 2行2列的第1个位置
imagesc(20*log10(abs(change_map1')+1)); 
colormap('gray'); 
title('Difference Map: Bscan2 - Bscan1'); 
xlabel('Y axis'); 
ylabel('Z axis'); 

% 子图2
subplot(2,2,2); % 2行2列的第2个位置
imagesc(20*log10(abs(change_map2')+1)); 
colormap('gray'); 
title('Difference Map: Bscan3 - Bscan2'); 
xlabel('Y axis'); 
ylabel('Z axis');

% 子图3
subplot(2,2,3); % 2行2列的第3个位置
imagesc(20*log10(abs(change_map3')+1)); 
colormap('gray'); 
title('Difference Map: Bscan4 - Bscan3'); 
xlabel('Y axis'); 
ylabel('Z axis');

% 子图4
subplot(2,2,4); % 2行2列的第4个位置
imagesc(20*log10(abs(change_map4')+1)); 
colormap('gray'); 
title('Difference Map: Bscan5 - Bscan4'); 
xlabel('Y axis'); 
ylabel('Z axis');



