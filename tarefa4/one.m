image = imread('cameraman.tif');
image = im2double(image);

dft = fft2(image);

real_part = ifft2(real(dft));
imaginary_part = ifft2(1i*imag(dft));


