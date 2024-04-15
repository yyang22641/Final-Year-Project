function evaluateParameters(imageData)
    % 参数范围定义
    sigmaValues = 5:5:50;  % 调整sigma的范围和步长
    gaussianSigmas = 0.2;  % 调整gaussianSigma的范围和步长
    nScales = 4;
    
    % 初始化得分矩阵
    brisqueScores = zeros(length(sigmaValues), length(gaussianSigmas));
    niqeScores = zeros(length(sigmaValues), length(gaussianSigmas));
    piqeScores = zeros(length(sigmaValues), length(gaussianSigmas));
    totalScores = zeros(length(sigmaValues), length(gaussianSigmas));  % 新增综合得分矩阵
    
    % 循环处理每个sigma和gaussianSigma值
    for i = 1:length(sigmaValues)
        for j = 1:length(gaussianSigmas)
            sigma = sigmaValues(i);
            gaussianSigma = gaussianSigmas(j);
            thresholdingFactors = sigma * [4 4 4 4 4];  % 根据噪声水平选择阈值因子
            
            % 应用高斯滤波
            X = imgaussfilt(double(imageData), gaussianSigma);
            
            % 使用某种降噪方法，这里使用了SLQdecThreshRec函数，需提前定义或获取
            Xrec = SLQdecThreshRec(X, nScales, thresholdingFactors);
            
            % 计算图像质量评分
            brisqueScores(i, j) = brisque(Xrec);
            niqeScores(i, j) = niqe(Xrec);
            piqeScores(i, j) = piqe(Xrec);
            
            % 计算综合得分
            totalScores(i, j) = brisqueScores(i, j) + niqeScores(i, j) + piqeScores(i, j);
        end
    end
    
    % 寻找最大综合得分的参数组合
    [maxScore, idx] = max(totalScores(:));
    [bestSigmaIdx, bestGaussianSigmaIdx] = ind2sub(size(totalScores), idx);
    bestSigma = sigmaValues(bestSigmaIdx);
    bestGaussianSigma = gaussianSigmas(bestGaussianSigmaIdx);
    
    fprintf('Winner sigma: %f, Winner Gaussian Sigma: %f\n', bestSigma, bestGaussianSigma);
    
    % 绘制综合得分图表
    figure;
    imagesc(gaussianSigmas, sigmaValues, totalScores);
    title('Total Quality Scores');
    xlabel('Gaussian Sigma');
    ylabel('Sigma');
    colorbar;
end
