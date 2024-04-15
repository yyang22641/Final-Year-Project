% 假设Bscan1是你的输入图像数据
% 定义Sigma值的范围，例如从0.1到2，每次增加0.5
sigmaValues = 0.02:0.05:3;

% 初始化得分数组
brisqueScores = zeros(length(sigmaValues), 1);
niqeScores = zeros(length(sigmaValues), 1);
piqeScores = zeros(length(sigmaValues), 1);

% 循环处理每个Sigma值
for i = 1:length(sigmaValues)
    Sigma = sigmaValues(i);
    
    % 计算Hessian矩阵分量
    [Dxx, Dxy, Dyy] = Hessian2D(Bscan1, Sigma);
    
    % 计算Hessian增强后的图像
    Bscan1_hessian = sqrt(Dxx.^2 + Dyy.^2);
    
    % 计算并存储每种评估方法的得分
    % 注意：这些函数需要Image Processing Toolbox和相关支持文件
    brisqueScores(i) = brisque(Bscan1_hessian);
    niqeScores(i) = niqe(Bscan1_hessian);
    piqeScores(i) = piqe(Bscan1_hessian);
    
%     % 显示处理后的图像（可选）
%     figure;
%     subplot(2,1,1); imshow(20*log(abs(Bscan1')), []); title(['Original, Sigma = ', num2str(Sigma)]);
%     subplot(2,1,2); imshow(20*log(abs(Bscan1_hessian')), []); title(['Hessian Enhanced, Sigma = ', num2str(Sigma)]);

%     % 显示处理后的图像（可选）
%     figure;
%     subplot(2,1,1); imshow(Bscan1', []); title(['Original, Sigma = ', num2str(Sigma)]);
%     subplot(2,1,2); imshow(Bscan1_hessian', []); title(['Hessian Enhanced, Sigma = ', num2str(Sigma)]);
end

% 显示评估得分结果
figure;
plot(sigmaValues, brisqueScores, '-o', sigmaValues, niqeScores, '-+', sigmaValues, piqeScores, '-*');
legend('BRISQUE Scores', 'NIQE Scores', 'PIQE Scores');
xlabel('Sigma Values');
ylabel('Quality Scores');
title('Quality Scores for different Sigma Values');


