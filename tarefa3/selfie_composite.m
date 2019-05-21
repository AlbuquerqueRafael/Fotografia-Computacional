F = im2double(imread('selfie_composite/original_resize.png'));
alfa = im2double(imread('selfie_composite/fixed_mask_png.png'));
B = im2double(imread('foto.jpg'));

comp = alfa.*F+(1-alfa).*B;