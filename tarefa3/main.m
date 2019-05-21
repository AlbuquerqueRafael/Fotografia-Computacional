F = im2double(imread('GT04.png'));
B = im2double(imresize(imread('background_images/background.png'), [563,800]));
alfa = im2double(imread('GT04_alpha.png'));

B  = im2double(imread('day_and_night/couple.jpg')); 
F = im2double(imread('day_and_night/super.jpg')); 
alfa    = im2double(imread('day_and_night/super_mask.jpg')); 

comp = alfa.*F+(1-alfa).*B;