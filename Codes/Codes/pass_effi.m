function [Z]=pass_effi(X,R,P,q)
% P=5;
% q=1;
[I1,I2,I3]=size(X);
Q1=randn(I2,R+P,I3);

for i=1:q
if mod(i,2)==1
    [Q2,R2]=QR_tubal(t_prod(X,Q1));
else
    [Q1,R1]=QR_tubal(t_prod(t_trans(X),Q2));
end
end
if mod(q,2)==0
[V,S,U]=tensor_t_svd(R1,R);
else
[U,S,V]=tensor_t_svd(R2,R);
end
V=t_prod(Q1,V);
U=t_prod(Q2,U);

Z=t_prod(t_prod(U,S),t_trans(V));
