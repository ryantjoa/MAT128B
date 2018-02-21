%Part iii

%The program is the inverse iteration method that plots the Julia set
%%
c = 0.36 + 0.1i;                %Defining c value            
orbit_vector = [];              %Defining empty vector for plotting        
                             
for j=1:201 
    y = -1 + (j-1)*.01;         %Defining x,y, and z values   
    for k=1:201                 
        x = -1 + (k-1)*.01;     
        orbit = x+1i*y;            
        iteration = 0;              
        
        while iteration < 100 && abs(orbit) < 2 
            iteration = iteration+1;
            phi = orbit-c;
            
            x = real(phi);      %Seperating x as real and y as imaginary     
            y = imag(phi);
            r = sqrt((x^2+y^2));
            theta = atan2(y,x); %This function is fro x < 0 which adds pi
            orbit = sqrt(r)*(cos(theta/2)+1i*sin(theta/2));
            
            mod_num = 2;        %Defining random number for phi=+-sqrt(w-c)
            ran_num = randi(100,1,1); 
            if mod(ran_num,mod_num) == 1   
                orbit = -orbit;       
            else
                orbit = orbit;
            end
        end    
          orbit_vector= [orbit_vector, orbit];   
        end
       
    end
    
plot(orbit_vector,'.')
axis xy
