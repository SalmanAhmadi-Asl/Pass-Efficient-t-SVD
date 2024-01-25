clc;clear all
warning off
% BB = imread('TextMask256.png');
% QS = double(BB>128);
B=double(imread('lena.bmp')); 
% B_Miss=double(imread('baboon_miss_1.bmp'));
% B=double(imread('kodim16.png'));
mr=0.80;
S = size(B); 
Q = gen_W(S,mr);


% Q(:,:,1)=QS;
% Q(:,:,2)=QS;
% Q(:,:,3)=QS;
% Q=double(B_Miss~=0);
B_Miss =  B.*Q;
%  B_Miss=Yw;

% PSNR(B_Miss,B)



%X=B_Miss;
ps=[];
sm=[];
P=10;
% b=100;
R=50;
%  X=rand(512,768,3);
X=rand(256,256,3);
%p=10;
q=2;
subplot(1,3,1)
imshow(uint8(B))
title('Original image')
subplot(1,3,2)
imshow(uint8(B_Miss))
title('Observed image')
subplot(1,3,3)
tic
for i=1:100
Y=pass_effi(X,R,P,q);
X=B_Miss+(~Q).*Y;
X=imgaussfilt(X,0.4);
imshow(uint8(X))
title('Recovered image')
drawnow
fprintf('Iteration:%d: i, PSNR:%f\n',i,PSNR(X,B));
end
toc
