clear all;
load('OCTimage.mat'); 
temp=squeeze(OCTamp(:,1:300,:));
meanOCTamp=(OCTamp(:,1:300,:)+OCTamp(:,301:600,:)+OCTamp(:,601:900,:)+OCTamp(:,901:1200,:)+OCTamp(:,1201:1500,:))/5; 
enFaceImage = mean(temp, 3);
enFaceImageAve = mean(meanOCTamp,3);
subplot(211),imagesc(enFaceImage'),colormap(gray);
title('en Face image of group 1')
axis image;
subplot(212),imagesc(enFaceImageAve'),colormap(gray);
title('Average en Face image')
axis image;

% you can run this code to see typical OCT image
%clear all;
%load('OCTimage.mat') % get the OCT 3D data cube
%iX=150;temp=squeeze(OCTamp(iX,:,:)); % choose one of the B-scan images
%iY=500;temp2=squeeze(OCTamp(:,iY,:)); % choose one of the B-scan images
%meanOCTamp=(temp(1:300,:)+temp(301:600,:)+temp(601:900,:)+temp(901:1200,:)+temp(1201:1500,:))/5; % calculate the averaged image
%figure(3) % display typical OCT image
%subplot(211),imagesc(20*log10(temp')),colormap(gray);
%title(['Bscan image at iX=' num2str(iX)])
%subplot(212),imagesc(20*log10(temp2')),colormap(gray);
%title(['Bscan image at iY=' num2str(iY)])
%subplot(212),imagesc(20*log10(meanOCTamp')),colormap(gray);
%title('averaged image')