function [psnr] = psnr(image1, image2)
    mse = 0;
    [M,N] = size(image1);
    
    for u = 1:M
        for v = 1:N
            error = (image1(u, v) - image2(u,v))^2;
            mse = mse + error;
        end
    end
    
    psnr = real(20 * log10 (1) - 10*log10(mse));
end

