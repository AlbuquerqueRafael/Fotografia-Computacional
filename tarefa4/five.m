image = imread('cameraman.tif');
[M,N] = size(image);
image = im2double(image);

%letter a
resultA = fft2(image);
F = zeros(M,N);
 agl = angle(resultA);
 
for u = 1:M
    for v = 1:N
        F(u,v) = resultA(u,v) /  exp(1i * agl(u,v));
    end
end

reconstructed_a = ifft2(abs(F));


%letter b
resultB = fft2(image);
F = zeros(M,N);
agl = angle(resultB);

for u = 1:M
    for v = 1:N
       F(u,v) = exp(1i*agl(u,v));
    end
end

reconstructed_b = ifft2(F);


subplot(2, 2, 1), imshow(im2uint8(reconstructed_a), []), title('imagem a');
subplot(2, 2, 2), imshow(im2uint8(reconstructed_b + 0.5), []), title('imagem b');