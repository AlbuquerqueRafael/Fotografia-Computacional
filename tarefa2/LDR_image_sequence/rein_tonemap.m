%run main.m first

%constants
RED = 1;
GREEN = 2;
BLUE = 3;
ALFA = 0.18;
numLines = 600;
numCollumns = 903;
N = numLines * numCollumns;
gamma = 2.2;
gamma_correction = 1 / gamma;

%Compute the average log luminance
hdr_image1 = hdr_image;

%%Luminance of the linearized intensity 
lw = hdr_image1(:,:,RED) * 0.299 + hdr_image1(:,:,GREEN) * 0.587 + hdr_image1(:,:,BLUE) * 0.114;

%%Calculating sum
sum = 0;

for i = 1:numLines
    for j = 1:numCollumns
       sum = sum + log(lw(i,j) + 0.0001);
    end
end

lw_ = sum / N;
lw_ = exp(lw_);

%Global Operator

for i = 1:numLines
    for j = 1:numCollumns
       l(i,j) = 0.18 * lw (i,j) / lw_;
    end
end

lg = (l  + l.*2) / 1 + l;

%Calcular final color 
for i = 1:numLines
    for j = 1:numCollumns
       reinMap(i,j,3) = ((hdr_image(i,j,3) ./ lw(i,j)).*gamma_correction)*lg(i,j);
       reinMap(i,j,2) = ((hdr_image(i,j,2) ./ lw(i,j)).*gamma_correction)*lg(i,j);
       reinMap(i,j,1) = ((hdr_image(i,j,1) ./ lw(i,j)).*gamma_correction)*lg(i,j);
    end
end

imshowpair(reinMap, rgb_matlab, 'montage');


