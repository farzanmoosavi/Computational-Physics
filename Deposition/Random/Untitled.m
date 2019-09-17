clc
close all
y = zeros(1,200 );
y_square = zeros(1,200);
w = zeros(1,40000);
axis ([0 200 0 20])
hold on
title('random deposition')
xlabel('lattice (n/L)')
ylabel('height')
for i = 1:4200
       
  a = randi([1 200]);
  h = [a,a,a-1,a-1];
  y(a) = y(a) + 1;
  y_square(a) = y(a).^2;
  z = [y(a)-1,y(a),y(a),y(a)-1];
  if i <= 800
  fill(h,z,'b');
  elseif i > 800 && i <= 1600
      fill(h,z,'y');
  elseif i > 1600 && i <= 2400
      fill(h,z,'r');
  elseif i > 2400 && i <= 3200
   fill(h,z,'g');
  else
      fill(h,z,'m')
  end
  pause(0.001);
  w(i) = sqrt(mean(y_square) - (i/200).^2);
end


xlswrite("myFile.xlsx",w');
fprintf('the roughness of first interval is: %g\n',mean(w(1:800)))
fprintf('the roughness of second interval is: %g\n',mean(w(800:1600)))
fprintf('the roughness of third interval is: %g\n',mean(w(1600:2400)))
fprintf('the roughness of fourth interval is: %g\n',mean(w(2400:3200)))
fprintf('the roughness of last interval is: %g\n',mean(w(3200:4000)))

