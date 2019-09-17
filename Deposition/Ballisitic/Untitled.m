clc
close all
y = zeros(1,200);
holder = zeros(1,100000);
y_square = zeros(1,200);
w = zeros(1,1000000);
axis ([0 200 0 210])
hold on
title('ballistic deposition')
xlabel('lattice')
ylabel('height')
%for j = 1:25
for i = 1:10000
  a = randi([1 200]);
 
  
  if a == 1      
      if y(a) == y(a+1) 
  h = [a,a,a-1,a-1];
  y(a) = y(a) + 1;
  z = [y(a)-1,y(a),y(a),y(a)-1];
  y_square(a) = y(a).^2;
      elseif y(a) > y(a+1)
      h = [a+1,a+1,a,a];
  y(a+1) = y(a+1) + 1;
  z = [y(a+1)-1,y(a+1),y(a+1),y(a+1)-1];    
      y_square(a+1) = y(a+1).^2;
      elseif y(a) < y(a+1)
           h = [a,a,a-1,a-1];
  y(a) = y(a+1);
  z = [y(a)-1,y(a),y(a),y(a)-1];
  y_square(a) = y(a).^2;
      end
  elseif a == 200
  if y(a) == y(a-1) 
   h = [a,a,a-1,a-1];
  y(a) = y(a) + 1;
  z = [y(a)-1,y(a),y(a),y(a)-1];
  y_square(a) = y(a).^2;
  elseif y(a) > y(a-1)
   h = [a-1,a-1,a-2,a-2];
  y(a-1) = y(a-1) + 1;
  z = [y(a-1)-1,y(a-1),y(a-1),y(a-1)-1];    
  y_square(a-1) = y(a-1).^2;
  elseif y(a) < y(a-1)
       y(a) = y(a-1);
  z = [y(a)-1,y(a),y(a),y(a)-1];
  y_square(a) = y(a).^2;
  end
  
  elseif y(a) == y(a+1) && y(a-1) == y(a+1) && y(a) == y(a-1)
        h = [a,a,a-1,a-1];
  y(a) = y(a) + 1;
  z = [y(a)-1,y(a),y(a),y(a)-1];
      y_square(a) = y(a).^2;
  elseif y(a-1) == y(a) 
  if a ~= 1 && a ~= 200
      if y(a) == y(a+1) 
  y(a) = y(a) + 1;
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
  y_square(a) = y(a).^2;
      elseif y(a) < y(a+1)
          y(a) = y(a+1);
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
  y_square(a) = y(a).^2;
      elseif y(a) > y(a+1)
            y(a) = y(a) + 1;
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
      y_square(a) = y(a).^2;
      end
  end
  
  elseif y(a) == y(a+1) 
  if a ~= 1 && a ~= 200
      if y(a) == y(a-1) 
  y(a) = y(a) + 1;
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
      y_square(a) = y(a).^2;
      elseif y(a) < y(a-1)
           y(a) = y(a-1);
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
      y_square(a) = y(a-1).^2;
      elseif y(a) > y(a-1)
            y(a) = y(a) + 1;
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
      y_square(a) = y(a).^2;
      end
  end
  
  elseif y(a) > y(a-1)
  if a ~= 1 && a ~= 200
      if y(a) == y(a+1) 
  y(a) = y(a) + 1;
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
      y_square(a) = y(a).^2;
      elseif y(a) < y(a+1)
           y(a) = y(a+1);
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
      y_square(a) = y(a).^2;
      elseif y(a) > y(a+1)
      y(a) = y(a) + 1;
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
      y_square(a+1) = y(a+1).^2;
      end    
  end
  
   elseif y(a) < y(a-1)
  if a ~= 1 && a ~= 200
  if y(a) == y(a+1) 
  y(a) = y(a-1);
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
  y_square(a-1) = y(a-1).^2;
  elseif y(a) < y(a+1)
      if y(a-1) < y(a+1)
           y(a) = y(a+1);
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
  y_square(a-1) = y(a-1).^2;
      elseif y(a-1) > y(a+1)
           y(a) = y(a-1);
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
  y_square(a-1) = y(a-1).^2;
      end
      elseif y(a) > y(a+1)
  if y(a+1) > y(a-1)
  y(a) = y(a+1);
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
  y_square(a-1) = y(a-1).^2;
  elseif y(a+1) < y(a-1)
  y(a) = y(a-1) ;
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];    
  y_square(a+1) = y(a+1).^2;
  end
  end
  end 
          
  elseif  y(a+1) < y(a) && y(a-1) < y(a) && y(a+1) == y(a-1)
  if a ~= 1 && a ~= 200
      
  y(a) = y(a) + 1;
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
  y_square(a) = y(a).^2;
 
  end    
  
  
  elseif  y(a) < y(a+1)
  if a ~= 1 && a ~= 200
      if y(a) == y(a-1) 
      y(a) = y(a) + 1;
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
      y_square(a) = y(a).^2;
      elseif y(a) < y(a-1)
          if y(a-1) > y(a+1)
           y(a) = y(a-1);
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
      y_square(a) = y(a).^2;
          elseif y(a-1) < y(a+1)
               y(a) = y(a+1);
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
  y_square(a-1) = y(a-1).^2;
          end
      elseif y(a) > y(a-1)
      y(a) = y(a) + 1;
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
      y_square(a-1) = y(a-1).^2;
      end
  end
        
  elseif  y(a) > y(a+1)
  if a ~= 1 && a ~= 200
      if y(a) == y(a-1)  || y(a+1) == y(a-1)
      y(a) = y(a) + 1;
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
      y_square(a+1) = y(a+1).^2;
      elseif y(a) < y(a-1)
            y(a) = y(a-1);
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
      y_square(a+1) = y(a+1).^2;
      elseif y(a) > y(a-1)
          if y(a+1) > y(a-1)
      y(a) = y(a+1) ;
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
          y_square(a-1) = y(a-1).^2;
          elseif y(a+1) < y(a-1)
                y(a) = y(a-1) ;
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
          y_square(a+1) = y(a+1).^2;
          end
      end
  end
  
  end
  holder(1,i) = a;
  
  if i <= 4000
  fill(h,z,'y');
  elseif i > 4000 && i <= 8000
  fill(h,z,'b');
  elseif i > 8000 && i <= 12000
  fill(h,z,'r');
  elseif i > 12000 && i <= 16000
  fill(h,z,'g');
  else
  fill(h,z,'m')
  end
  pause(0.001);
  w(i) = sqrt(mean(y_square) - (i/200).^2);
end


xlsread("Myfile.xlsx",w);

fprintf('the roughness of first interval is: %g\n',mean(w(1:2000)))
fprintf('the roughness of second interval is: %g\n',mean(w(2000:4000)))
fprintf('the roughness of third interval is: %g\n',mean(w(40000:6000)))
fprintf('the roughness of fourth interval is: %g\n',mean(w(6000:80000)))
fprintf('the roughness of last interval is: %g\n',mean(w(8000:10000)))

