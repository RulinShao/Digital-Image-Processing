clear
clc
clf
colormap(gray)
% create example image
% ima=100*ones(100);
% ima(50:100,:)=50;
% ima(:,50:100)=2*ima(:,50:100);
ima = double(imread('images/home1.jpg'));
% fs=fspecial('average');
% ima=imfilter(ima,fs,'symmetric');
% add some noise
sigma=50;
rima=ima+sigma*randn(size(ima));
% show it
imshow(uint8(rima))
% drawnow
% denoise it
fima(:,:,1) = NLmeansfilter(rima(:,:,1),5,2,sigma);
fima(:,:,2) = NLmeansfilter(rima(:,:,2),5,2,sigma);
fima(:,:,3) = NLmeansfilter(rima(:,:,3),5,2,sigma);
% fima=NLmeansfilter(rima,5,2,sigma);
% show results
clf
subplot(2,2,1),imshow(uint8(ima)),title('original');
subplot(2,2,2),imshow(uint8(rima)),title('noisy');
subplot(2,2,3),imshow(uint8(fima)),title('filtered');
subplot(2,2,4),imshow(uint8(rima-fima)),title('residuals');
