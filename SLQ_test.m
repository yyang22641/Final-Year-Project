% 假设Bscan_ori_1是你的原始图像数据

% 设定参数搜索范围
sigmaValues = 10:10:50;               % Sigma测试范围
gaussianSigmaValues = 0.1:0.1:1;      % Gaussian Sigma测试范围
nScales = 4;                          % nScales测试值
thresholdFactorMultipliers = [4 4 4 4 4]; % 阈值因子倍数测试范围

% 初始化得分
bestScore = inf; % 假设使用的评估函数得分越低表示图像质量越好
bestParameters = struct();

% 循环所有参数组合
for sigma = sigmaValues
    for gaussianSigma = gaussianSigmaValues
        % thresholdingFactors需要根据sigma和multiplier来设置
        thresholdingFactors = sigma * thresholdFactorMultipliers;
        
        % 应用高斯滤波
        X = imgaussfilt(double(Bscan_ori_1), gaussianSigma);
        
        % 应用 SLQdecThreshRec 函数进行降噪
        Xrec = SLQdecThreshRec(X, nScales, thresholdingFactors);
        
        % 使用图像质量评估指标计算得分
        currentScore = brisque(Xrec); % 假设brisque函数可用
       

        % 如果找到了更好的得分
        if currentScore < bestScore
            bestScore = currentScore;
            bestParameters.sigma = sigma;
            bestParameters.gaussianSigma = gaussianSigma;
        end
    end
end

% 显示最佳参数
disp('Best Parameters Found:');
disp(bestParameters);

