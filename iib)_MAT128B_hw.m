%Raymond Canchola
%Generate(and plot)other examples changing value of c
%
%There are infinite amounts of julia sets by changing the values of c.
%In addition, there are two possiblites of changing the intial value z_0
%either phi(z) can stay bounded or increase towards indfinity.

%%
phi = @(z) z^2 -0.123 + 0.745i;
fixpt1 = (1 + sqrt(6))/2;
fixpt2 = (1 - sqrt(6))/2;
colormap([1 0 0; 1 1 1]);

M = 2*ones(141,361);

for j=1:141
    y = -0.7 + (j-1)*.01;
    for i=1:361
        x = -1.8 + (i-1)*.01;
        z = x + 1i*y;
        zk = z;
        iflag1 = 0;
        iflag2 = 0;
        kount = 0;
        
        while kount < 100 & abs(zk) < 2 & iflag1 < 5 & iflag2 < 5,
            kount = kount+1;
            zk = phi(zk);
            
            err1 = abs(zk-fixpt1);
            if err1 < 1.e-6
                iflag1 = iflag1 + 1;
            else
                iflag1 = 0;
            end
            
            err2 = abs(zk-fixpt2);
            if err2 < 1.e-6
                iflag2 = iflag2 + 1;
            else
                iflag2 = 0;
            end
        end
        if iflag1 >= 5 | iflag2 >= 5 | kount >= 100
            M(j,i) = 1;
        end
    end
end
image([-1.8 1.8],[-.7 .7],M)
axis xy