image = imread('cameraman_small.tif');
[M,N] = size(image);
image = im2double(image);

%letter a
resultA = fft2(image);
result_inverseA = idft_f(M, N, resultA);

%letter b
resultB = dft_f(M,N,image);
result_inverseB = ifft2(resultB);

%letter c
resultC = dft_f(M,N,image);
result_inverseC = idft_f(M, N, resultC);




subplot(2, 2, 1), imshow(result_inverseA, []), title('imagem a');
subplot(2, 2, 2), imshow(result_inverseB, []), title('imagem b');
subplot(2, 2, 3), imshow(result_inverseC, []), title('imagem c');
