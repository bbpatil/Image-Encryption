clc;
close all;
y=imread('cameraman.tif');
%y=imread('1.jpg');
%y=rgb2gray(y);
subplot(1,3,1)
imshow(y)
title('Original Image')
%y=rgb2gray(y);
y=double(y);
p=239;
z=primitiveroot(p);
%p=11;
%z=3;
a=3;
b=powermod(z^a,1,p);

k=5;
r=powermod(z^k,1,p);

[m n]=size(y);

for i=1:m
    for j=1:n
        
        r1(i,j)=powermod((y(i,j)*b^k),1,p);
    end
end

subplot(1,3,2)
imshow(uint8(r1))
title('Encrypted Image')


for i=1:m
    for j=1:n
        t1=powermod(r,-a,p);
        t2(i,j)=powermod(t1*r1(i,j),1,p);
        
    end
end

subplot(1,3,3)
imshow(uint8(t2))
title('Decrypted Image')

        


