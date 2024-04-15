[xSize, ySize, zSize] = size(OCTamp1);

% 初始化一个空矩阵来存储所有斑点方差图
allSpeckleVarianceMaps = zeros(xSize,ySize, zSize); % 注意：这里的维度顺序调整以适应最终存储格式

% 遍历x轴上的所有位置
for x = 1:xSize
    % 提取当前x位置的B-scan
    Bscan1 = squeeze(OCTamp1(x, :, :));
    Bscan2 = squeeze(OCTamp2(x, :, :));
    Bscan3 = squeeze(OCTamp3(x, :, :));
    Bscan4 = squeeze(OCTamp4(x, :, :));
    Bscan5 = squeeze(OCTamp5(x, :, :));

    % 初始化一个空矩阵来存储当前x位置的方差值
    [y_dim, z_dim] = size(Bscan1); % 假设所有Bscan图像大小相同
    speckleVarianceMap = zeros(y_dim, z_dim);

    % 计算斑点方差
    for i = 1:y_dim
        for j = 1:z_dim
            pixelIntensityVector = [Bscan1(i, j), Bscan2(i, j), Bscan3(i, j), Bscan4(i, j), Bscan5(i,j)];
            speckleVarianceMap(i, j) = var(pixelIntensityVector);
        end
    end

    % 将计算得到的斑点方差图存储到三维数组中
    allSpeckleVarianceMaps(x, :, :) = speckleVarianceMap;
end











