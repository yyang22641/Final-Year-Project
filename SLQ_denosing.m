sigma = 30;
gaussianSigma = 0.1;
nScales = 4;
thresholdingFactors = sigma * [4 4 4 4 4];  % 根据噪声水平选择阈值因子

X1 = imgaussfilt(double(Bscan_ori_1), gaussianSigma);
X2 = imgaussfilt(double(Bscan_ori_2), gaussianSigma);
X3 = imgaussfilt(double(Bscan_ori_3), gaussianSigma);
X4 = imgaussfilt(double(Bscan_ori_4), gaussianSigma);
X5 = imgaussfilt(double(Bscan_ori_5), gaussianSigma);

% 使用 SLQdecThreshRec 函数进行降噪
Xrec1 = SLQdecThreshRec(X1, nScales, thresholdingFactors);
Xrec2 = SLQdecThreshRec(X2, nScales, thresholdingFactors);
Xrec3 = SLQdecThreshRec(X3, nScales, thresholdingFactors);
Xrec4 = SLQdecThreshRec(X4, nScales, thresholdingFactors);
Xrec5 = SLQdecThreshRec(X5, nScales, thresholdingFactors);


Bscan1 = Xrec1;
Bscan2 = Xrec2;
Bscan3 = Xrec3;
Bscan4 = Xrec4;
Bscan5 = Xrec5;


% 显示原始、经SLQdecThreshRec降噪后和进一步经中值滤波降噪后的图像
    figure;
    ax1 = subplot(3,1,1);
    imshow(20*log10(Bscan_ori_1'), []);
    title('Original Image');
    set(ax1, 'DataAspectRatio', [1 5 1]);
    
    ax2 = subplot(3,1,2);
    imshow(20*log10(X1'), []);
    title('Denoised with Gaussian');
    set(ax2, 'DataAspectRatio', [1 5 1]);
    
    ax3 = subplot(3,1,3);
    imshow(20*log10(Bscan1'), []);
    title('Denoised with Gaussian and SLQdecThreshRec');
    set(ax3, 'DataAspectRatio', [1 5 1]);

clear X1 X2 X3 X4 X5 Xrec1 Xrec2 Xrec3 Xrec4 Xrec5 sigma nScales thresholdingFactors gaussianSigma



