image = imread('cameraman.tif');
[M,N] = size(image);
image = im2double(image);

%Letter a
dft_a = fft2(image);
dft_shiffted_a = fftshift(dft_a);

reconstructed_a = ifft2(dft_shiffted_a);

%Image in space domain
g = zeros(M,N);

for x = 1:M
    for y = 1:N
        g(x,y) =(-1)^(x+y) * image(x,y);
    end
end

dft_b = fft2(g);
reconstructed_b = ifft2(dft_b);


%Letter b
dft_c = fft2(image);
g = zeros(M,N);

for x = 1:M
    for y = 1:N
        g(x,y) =(-1)^(x+y) * dft_c(x,y);
    end
end

reconstructed_c = ifft2(g);


%Letter c
dft_shiffted_d = fftshift(image);
dft_d = fft2(dft_shiffted_d);
reconstructed_d = ifft2(dft_d);





subplot(2, 2, 1), imshow(reconstructed_a, []), title('imagem a');
subplot(2, 2, 2), imshow(reconstructed_b, []), title('imagem b');
subplot(2, 2, 3), imshow(reconstructed_c, []), title('imagem c');
subplot(2, 2, 4), imshow(reconstructed_d, []), title('imagem d');
