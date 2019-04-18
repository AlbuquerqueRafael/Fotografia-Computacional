files = {'office_1.jpg','office_2.jpg','office_3.jpg',
         'office_4.jpg','office_5.jpg','office_6.jpg'};
expTimes = [0.033 0.1000 0.33 0.63 1.3000 4.0000];
hdr = makehdr(files,'RelativeExposure',expTimes./expTimes(1));


rgb_matlab = tonemap(hdr);
imshowpair(rgb, rgb_matlab, 'montage');
