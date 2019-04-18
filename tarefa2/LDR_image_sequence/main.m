% get calibration curve array
calibration_curve;

%constants
numImages = 6;
numLines = 600;
numCollumns = 903;
numChannels = 3;
gammaValue = 2.2;

%read images
img1 = imread('office_1.jpg'); 
img2 = imread('office_2.jpg'); 
img3 = imread('office_3.jpg'); 
img4 = imread('office_4.jpg'); 
img5 = imread('office_5.jpg'); 
img6 = imread('office_6.jpg'); 

%applying gamma expansion
img1 = im2double(img1).*gammaValue; 
img2 = im2double(img2).*gammaValue; 
img3 = im2double(img3).*gammaValue;  
img4 = im2double(img4).*gammaValue;  
img5 = im2double(img5).*gammaValue;  
img6 = im2double(img6).*gammaValue; 

%images exposure values 
exposure1 = 0.033;
exposure2 = 0.1;
exposure3 = 0.33;
exposure4 = 0.63;
exposure5 = 1.3;
exposure6 = 4;


X1 = exp(C(im2uint8(img1) + 1));
X2 = exp(C(im2uint8(img2) + 1));
X3 = exp(C(im2uint8(img3) + 1));
X4 = exp(C(im2uint8(img4) + 1));
X5 = exp(C(im2uint8(img5) + 1));
X6 = exp(C(im2uint8(img6) + 1));

%Calculating irradiance
E1 = X1 / exposure1;
E2 = X2 / exposure2;
E3 = X3 / exposure3;
E4 = X4 / exposure4;
E5 = X5 / exposure5;
E6 = X6 / exposure6;

EARRAY = {E1, E2, E3, E4, E5, E6};
hdr_image = zeros(numLines, numCollumns, numChannels);
sum = 0;
count = 0;

for i = 1:numLines
    for j = 1:numCollumns
        for k = 1:numChannels
           for z= 1:numImages
              auxE = EARRAY{z};
              count = count + 1;
              sum = sum + auxE(i,j,k);
           end
           hdr_image(i,j,k) = sum / 6;
           count = 0;
           sum = 0;
        end
    end
end

rgb = tonemap(hdr_image);
imtool(rgb);