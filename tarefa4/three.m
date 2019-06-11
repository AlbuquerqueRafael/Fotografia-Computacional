image = imread('cameraman.tif');
image = im2double(image);


%Letter A
dftA = fft2(image);
dftA(1,1) = 0;

reconstructed_a = ifft2(dftA);


%Letter B
inten = mean(image(:));
newImage = image - inten;


