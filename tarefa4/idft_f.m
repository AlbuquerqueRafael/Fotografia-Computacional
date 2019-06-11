function [result] = idft_f(M, N, image)
    F = double(zeros(M,N));
    divisor = 1 / M*N;
    for u = 0:M-1
        for v = 0:N-1
            sum = 0;
            for x = 0:M-1
                for y = 0:N-1
                    ang = (2*pi*u*x)/double(M) + (2*pi*v*y)/double(N);
                    sum = sum + image(x+1,y+1) * (cos(ang) + 1i*sin(ang));
                end
            end
            F(u+1,v+1) = sum * divisor;
        end
    end
    
    result = F;
end
