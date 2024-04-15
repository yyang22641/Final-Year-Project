% 初始化一个空矩阵来存储方差值
[rows, cols] = size(Bscan1); % 假设所有Bscan图像大小相同
speckleVarianceMap = zeros(rows, cols);

% 计算斑点方差
for i = 1:rows
    for j = 1:cols
        pixelIntensityVector = [Bscan1(i, j), Bscan2(i, j), Bscan3(i, j), Bscan4(i, j), Bscan5(i,j)];
        speckleVarianceMap(i, j) = var(pixelIntensityVector);
    end
end

% 设置方差的阈值
varianceThreshold = -80; % 分贝阈值
linearThreshold = 10^(varianceThreshold/10); % 将分贝阈值转换为线性阈值

% 应用阈值以强调高方差区域
speckleVarianceMapThresholded = speckleVarianceMap;
speckleVarianceMapThresholded(speckleVarianceMap < linearThreshold) = 0;

% 使用伪彩色映射并调整对比度以提高可视化效果
figure;
imagesc(speckleVarianceMapThresholded');
colormap('hot'); % 使用热图颜色映射来增强可视化效果
clim([linearThreshold max(speckleVarianceMap(:))]); % 限制颜色轴的范围以提高对比度
colorbar;
title('Enhanced Speckle Variance Map at x=150');
xlabel('Y axis');
ylabel('Z axis');


