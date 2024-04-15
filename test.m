iX=150;temp=squeeze(aligned_OCTamp(iX,:,:)); % choose one of the B-scan images
iY=500;temp2=squeeze(aligned_OCTamp(:,iY,:)); % choose one of the B-scan images
meanOCTamp=(temp(1:300,:)+temp(301:600,:)+temp(601:900,:)+temp(901:1200,:)+temp(1201:1500,:))/5; % calculate the averaged image
figure(2) % display typical OCT image
subplot(211),imagesc(20*log10(temp')),colormap(gray);
title(['Bscan image at iX=' num2str(iX)])
subplot(212),imagesc(20*log10(temp2')),colormap(gray);
title(['Bscan image at iY=' num2str(iY)])
%subplot(212),imagesc(20*log10(meanOCTamp')),colormap(gray);
%title('averaged image')