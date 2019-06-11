image = imread('cameraman_small.tif');
[M,N] = size(image);
image = im2double(image);
sum = 0;
x = 1;
y = 1;
ang = (2*pi*x)/double(M) + (2*pi*y)/double(N);
sum = image(x,y) *(cos(ang) - 1i*sin(ang));
sum
for x = 1:M
    for y = 1:N
        ang = (2*pi*x)/double(M) + (2*pi*y)/double(N);
        sum = sum + image(x,y) * (cos(ang) - 1i*sin(ang));
    end
end


