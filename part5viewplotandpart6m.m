clear
%close all
phi = @(z) z^2 - 1.25;
a = 141; 
b = 361;

orbit = 0;
colormap([1 0.25 0; 1 1 1]);
n = 1;
M = 2*ones(a,b);
 

for j=1:a,
    y = -0.7 + (j-1)*.01;
    for i=1:b
        x = -1.8 + (i-1)*.01;
        z = x + 1i*y;
        orbit = z;
        kount = 0;
        
        while kount < 100 && abs(orbit) < 100   %If orbit=phi(orbit(0)) < 100 the points inside are connected. Hence, any points that lie in this bound are connected                          

            kount = kount+1;
            orbit = phi(orbit);
        end
        
        if kount >= 100
            M(j,i) = 1;
        else
            if abs(orbit) >= 100
                M(j,i) = kount/100 +1;
            end
        end
        
        if abs(phi(orbit)) > 100                %If orbit=phi(orbit(0)) > 100 the points are disconnected. Hence, these points are outside of julia set and are not connected.
            orbit = phi(orbit);                 %Here is where you grab the disconnected the points that are greater then the bound and color shade them
        end 
    end
end
%% 
%figure;image([-1,1],[-1,1],M,'CDataMapping','scaled')
%figure;image([-1,1],[-1,1],M.^2,'CDataMapping','scaled')
figure;imagesc(M,[1,1.3])
axis xy