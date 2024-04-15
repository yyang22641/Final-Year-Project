% 计算变化图
a = Bscan3 - Bscan1;
b = Bscan4 - Bscan2;
c = Bscan5 - Bscan3;
change_map_total = a+b+c;

figure;
imagesc(20*log10(abs(change_map_total')+1));
colormap('gray'); 
title('Difference Map');
xlabel('Y axis');
ylabel('Z axis');