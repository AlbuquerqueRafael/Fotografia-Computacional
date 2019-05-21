F = im2double(imread('./day_and_night/black_sun_mask_resize.jpg'));
[x,y, channels] = size(F);
firstPixel = 0;
firstX = 0;
firstY = 0;

lastX = 0;
lastY = 1;

for c = 1:x
    for r = 1:y
        red = F(c,r,1);
        if (firstPixel == 0)
            if (red == 0) 
              firstPixel = 1;
              firstX = c;
              firstY = r;
            end
        else
            if (red == 0)
                lastX = c;
                lastY = r;
            end
        end
        
    end
end


for c = 1:x
    for r = 1:y
        if (~((c >= firstX && c <= lastX) && (r >= firstY && r <= lastY)))
            F(c,r,1) = 0;
            F(c,r,2) = 0;
            F(c,r,3) = 0;
        end
    end
end

imwrite(F, 'black_sun_mask_resize_fixed.jpg');




