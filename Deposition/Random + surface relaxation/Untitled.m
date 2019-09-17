clc
close all
y = zeros(1,100);
holder = zeros(1,100000);
y_square = zeros(1,200);
w = zeros(1,1000000);
axis ([0 100 0 1000])
hold on
title('random deposition and surface relaxation')
xlabel('lattice')
ylabel('height')
%for j = 1:25
for i = 1:100000
  a = randi([1 100]);
 
  
  if a == 1      
      if y(a) == y(a+1) || y(a) < y(a+1)
  h = [a,a,a-1,a-1];
  y(a) = y(a) + 1;
  z = [y(a)-1,y(a),y(a),y(a)-1];
  y_square(a) = y(a).^2;
      elseif y(a) > y(a+1)
      h = [a+1,a+1,a,a];
  y(a+1) = y(a+1) + 1;
  z = [y(a+1)-1,y(a+1),y(a+1),y(a+1)-1];    
      y_square(a+1) = y(a+1).^2;
      end
  elseif a == 100
  if y(a) == y(a-1) || y(a) < y(a-1)
   h = [a,a,a-1,a-1];
  y(a) = y(a) + 1;
  z = [y(a)-1,y(a),y(a),y(a)-1];
  y_square(a) = y(a).^2;
  elseif y(a) > y(a-1)
   h = [a-1,a-1,a-2,a-2];
  y(a-1) = y(a-1) + 1;
  z = [y(a-1)-1,y(a-1),y(a-1),y(a-1)-1];    
  y_square(a-1) = y(a-1).^2;
  end
  
  elseif y(a) == y(a+1) && y(a-1) == y(a+1) && y(a) == y(a-1)
        h = [a,a,a-1,a-1];
  y(a) = y(a) + 1;
  z = [y(a)-1,y(a),y(a),y(a)-1];
      y_square(a) = y(a).^2;
  elseif y(a-1) == y(a) 
  if a ~= 1 && a ~= 100
      if y(a) == y(a+1) || y(a) < y(a+1)
  y(a) = y(a) + 1;
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
  y_square(a) = y(a).^2;
      elseif y(a) > y(a+1)
            y(a+1) = y(a+1) + 1;
  h = [a+1,a+1,a,a];
  z = [y(a+1)-1,y(a+1),y(a+1),y(a+1)-1];
      y_square(a+1) = y(a+1).^2;
      end
  end
  
  elseif y(a) == y(a+1) 
  if a ~= 1 && a ~= 100
      if y(a) == y(a-1) || y(a) < y(a-1)
  y(a) = y(a) + 1;
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
      y_square(a) = y(a).^2;
      elseif y(a) > y(a-1)
            y(a-1) = y(a-1) + 1;
  h = [a-1,a-1,a-2,a-2];
  z = [y(a-1)-1,y(a-1),y(a-1),y(a-1)-1];
      y_square(a-1) = y(a-1).^2;
      end
  end
  
  elseif y(a) < y(a-1)
  if a ~= 1 && a ~= 100
      if y(a) == y(a+1) || y(a) < y(a+1)
  y(a) = y(a) + 1;
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
      y_square(a) = y(a).^2;
      elseif y(a) > y(a+1)
      y(a+1) = y(a+1) + 1;
  h = [a+1,a+1,a,a];
  z = [y(a+1)-1,y(a+1),y(a+1),y(a+1)-1];
      y_square(a+1) = y(a+1).^2;
      end    
  end
  
   elseif y(a) > y(a-1)
  if a ~= 1 && a ~= 100
  if y(a) == y(a+1) || y(a) < y(a+1) || y(a+1) == y(a-1)
  y(a-1) = y(a-1) + 1;
  h = [a-1,a-1,a-2,a-2];
  z = [y(a-1)-1,y(a-1),y(a-1),y(a-1)-1];
  y_square(a-1) = y(a-1).^2;
  elseif y(a) > y(a+1)
  if y(a+1) > y(a-1)
  y(a-1) = y(a-1) + 1;
  h = [a-1,a-1,a-2,a-2];
  z = [y(a-1)-1,y(a-1),y(a-1),y(a-1)-1];
  y_square(a-1) = y(a-1).^2;
  elseif y(a+1) < y(a-1)
  y(a+1) = y(a+1) + 1;
  h = [a+1,a+1,a,a];
  z = [y(a+1)-1,y(a+1),y(a+1),y(a+1)-1];    
  y_square(a+1) = y(a+1).^2;
  end
  end
  end 
          
  elseif  y(a+1) < y(a) && y(a-1) < y(a) && y(a+1) == y(a-1)
  if a ~= 1 && a ~= 100
      rand = randi([1 2]);
  if rand == 1
  y(a-1) = y(a-1) + 1;
  h = [a-1,a-1,a-2,a-2];
  z = [y(a-1)-1,y(a-1),y(a-1),y(a-1)-1];
  y_square(a-1) = y(a-1).^2;
  elseif rand == 2
  y(a+1) = y(a+1) + 1;
  h = [a+1,a+1,a,a];
  z = [y(a+1)-1,y(a+1),y(a+1),y(a+1)-1];
  y_square(a+1) = y(a+1).^2;
  end
  end    
  
  
  elseif  y(a) < y(a+1)
  if a ~= 1 && a ~= 100
      if y(a) == y(a-1) || y(a) < y(a-1)
      y(a) = y(a) + 1;
  h = [a,a,a-1,a-1];
  z = [y(a)-1,y(a),y(a),y(a)-1];
      y_square(a) = y(a).^2;
      elseif y(a) > y(a-1)
      y(a-1) = y(a-1) + 1;
  h = [a-1,a-1,a-2,a-2];
  z = [y(a-1)-1,y(a-1),y(a-1),y(a-1)-1];
      y_square(a-1) = y(a-1).^2;
      end
  end
        
  elseif  y(a) > y(a+1)
  if a ~= 1 && a ~= 200
      if y(a) == y(a-1) || y(a) < y(a+1) || y(a+1) == y(a-1)
      y(a+1) = y(a+1) + 1;
  h = [a+1,a+1,a,a];
  z = [y(a+1)-1,y(a+1),y(a+1),y(a+1)-1];
      y_square(a+1) = y(a+1).^2;
      elseif y(a) > y(a-1)
          if y(a+1) > y(a-1)
      y(a-1) = y(a-1) + 1;
  h = [a-1,a-1,a-2,a-2];
  z = [y(a-1)-1,y(a-1),y(a-1),y(a-1)-1];
          y_square(a-1) = y(a-1).^2;
          elseif y(a+1) < y(a-1)
                y(a+1) = y(a+1) + 1;
  h = [a,a,a-1,a-1];
  z = [y(a+1)-1,y(a+1),y(a+1),y(a+1)-1];
          y_square(a+1) = y(a+1).^2;
          end
      end
  end
  
  end
  holder(1,i) = a;
  
  if i <= 20000
  fill(h,z,'y');
  elseif i > 20000 && i <= 40000
  fill(h,z,'b');
  elseif i > 40000 && i <= 60000
  fill(h,z,'r');
  elseif i > 60000 && i <= 80000
  fill(h,z,'g');
  else
  fill(h,z,'m')
  end
  pause(0.001);
  w(i) = sqrt(mean(y_square) - (i/200).^2);
end

xlswrite("myFile.xlsx",w');



fprintf('the roughness of first interval is: %g\n',mean(w(1:20000)))
fprintf('the roughness of second interval is: %g\n',mean(w(20000:40000)))
fprintf('the roughness of third interval is: %g\n',mean(w(40000:60000)))
fprintf('the roughness of fourth interval is: %g\n',mean(w(60000:00000)))
fprintf('the roughness of last interval is: %g\n',mean(w(80000:100000)))

