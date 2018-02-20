%Program_v
%
%The program enables us to show connectedness by stating if abs(orbit)<100 then it is connected
%and the program returns a logic statement true = 1 or false = 0
%%
clear
close all
c = 1.25;           %User selects c value
phi = @(z) z^2-c;

orbit = 0;

for k=1:100
            
orbit = phi(orbit);

    if abs(orbit) < 100   %If abs(orbit) < 100, Julia set is bounded and connected 
         answer = true(1);
    else
         answer = false(1);
    end    
end
      
answer

