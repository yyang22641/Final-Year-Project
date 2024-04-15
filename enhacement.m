% 确定最佳的Sigma值
Sigma = 0.47;

% 创建一个图像数组，这里只是一个示例，实际应用中你需要替换成你的Bscan图像
Bscans = {Bscan1, Bscan2, Bscan3, Bscan4, Bscan5};

% 循环处理每个Bscan图像
for i = 1:length(Bscans)
    Bscan = Bscans{i};
    
    % 计算Hessian矩阵分量
    [Dxx, ~, Dyy] = Hessian2D(Bscan, Sigma);
    
    % 计算Hessian增强后的图像
    Bscan_hessian = sqrt(Dxx.^2 + Dyy.^2);
    
%     % 显示原始和增强后的图像进行比较
%     figure;
%     ax1=subplot(2,1,1); imshow(Bscan', []); title(['Original Bscan', num2str(i)]);
%     set(ax1, 'DataAspectRatio', [1 5 1]);
%     ax2=subplot(2,1,2); imshow(Bscan_hessian', []); title(['Hessian Enhanced Bscan', num2str(i)]);
%     set(ax2, 'DataAspectRatio', [1 5 1]);
%     
    % 如果满意，可以选择替换原来的Bscan
    Bscans{i} = Bscan_hessian;
end

% 如果上面的显示结果令人满意，取消下面注释的代码可以一次性替换所有Bscan图像
% for i = 1:length(Bscans)
%     Bscans{i} = sqrt(Hessian2D(Bscans{i}, Sigma).^2 + Dyy.^2);
% end

% 此时Bscans数组包含了增强后的图像
