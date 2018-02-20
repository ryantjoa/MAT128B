clear
close all
phi = @(z) z^2 - 1.25;
orbit = 0;
 

for j=1:141,
    y = -0.7 + (j-1)*.01;
    for i=1:361
        x = -1.8 + (i-1)*.01;
        z = x + 1i*y;
        orbit = z;
        kount = 0;
        

        while kount < 100 && abs(orbit) < 100   %If orbit=phi(orbit(0)) < 100 the points inside are connected. Hence, any points that lie in this bound are connected
                                                %Thus, if points abs(orbit) <
                                                %100 then it stays in loop
                                                %and if not jumps out of
                                                %loop to the next if statement
            kount = kount+1;
            orbit = phi(orbit);                
        

        end
        

        if abs(phi(orbit)) > 100                %If orbit=phi(orbit(0)) > 100 the points are disconnected. Hence, these points are outside of julia set and are not connected.
            orbit = phi(orbit);                 %Here is where you grab the disconnected points that are greater then the bound and color shade them
        end 
    end
   						%To see what I am talking about with the orbit less than the bound(100) and greater then the bound(100) undo the semi-colon on both orbits in the while loop
                        %kand the if statement and also rename the orbit in the if statement so you can see how orbit jumps around.

end

