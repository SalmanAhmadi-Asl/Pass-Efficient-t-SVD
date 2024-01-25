clc;clear 
X=double(imread('kodim23.png'));
P=5;
q=3;
R=65;

tic
Y=pass_effi(X,R,P,q);
time=toc;
ERR=X-Y;
fprintf('---Results for the pass-efficient algorithm------\n Time: %f, PSNR=%f,  Relative Error: %f\n',time, PSNR(X,Y),norm(ERR(:))/norm(X(:)))

tic
[U,S,V]=tensor_t_svd(X,R);
time=toc;
ERR=X-t_prod(t_prod(U,S),t_trans(V));
%
subplot(1,3,3)
fprintf('---Results for the truncated T-SVD------\n Time=%f, PSNR=%f,  Relative Error: %f\n',time,PSNR(X,t_prod(t_prod(U,S),t_trans(V))),norm(ERR(:))/norm(X(:)))
subplot(1,3,1)
imshow(uint8(X))
title('Original image')
subplot(1,3,2)
imshow(uint8(t_prod(t_prod(U,S),t_trans(V))))
title('Proposed Algorithm')
subplot(1,3,3)
imshow(uint8(t_prod(t_prod(U,S),t_trans(V))))
title('Truncated T-SVD Algorithm')
