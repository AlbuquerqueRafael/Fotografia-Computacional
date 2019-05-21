F = im2double(imread('./day_and_night/moon.jpg'));
[x,y, channels] = size(F);

for c = 1:x
    for r = 1:y
        if ((F(c,r,1) >= 0.7 && F(c,r,1) <= 0.729) && (F(c,r,2) >= 0.03 && F(c,r,2) <= 0.049))
            F(c,r,1) = 0;
            F(c,r,2) = 0;
            F(c,r,3) = 0;
        else
            F(c,r,1) = 1;
            F(c,r,2) = 1;
            F(c,r,3) = 1;
        end
    end
end
