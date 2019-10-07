clc
close all
p = 0;
L = input('the lattice size is: ');
S = zeros(1,100);

index = 1;
while p <= 1
   all_r_g = []; 
    for numbers_of_run = 1:100
% arrays of lattice square
X = rand(L+1,L+1);
% arrays that have occupied
 r = X < p;
r(:,1) = 0;
r(1,:) = 0;

 flag = 0; %for step
 k = 1;%colour index
 i = zeros(L+1,L+1); %colour index
 for y = 2 : L+1 % counting in coloumns
 for x = 2 : L+1
 if r(x,y) == 0
     continue
 else 
      if r(x,y-1) == 0 
          if r(x-1,y) == 0 
             i(x,y) = k;
             y_1 = i(x,y);
             k = k + 1;
             continue
          elseif r(x-1,y) ~= 0
             i(x,y) = i(x-1,y);
             y_1 = i(x,y);
              continue
          end
      elseif r(x,y-1) ~= 0
           i(x,y) = i(x,y-1);
           y_1 = i(x,y);
               if r(x-1,y) == 0
                   continue
               elseif r(x-1,y) ~= 0
               y_1 = i(x,y-1);
               x_1 = i(x-1,y);       
               i(x,y-1)= i(x-1,y);
               continue
               end
      end
 end
     
 end
 end
 
i = i(2:L+1,2:L+1);
[i,num] = bwlabel(i,4);
[area,rcm,r_g] = radiusofgyration(i,num);
all_r_g = sort(r_g);
size_of_all_r_g = (size(all_r_g ));
%radius of gyration 
if size_of_all_r_g(1) ~= 1 && size_of_all_r_g(1) ~= 0
    value_of_r_g = all_r_g(size_of_all_r_g(1)-1);
else
    value_of_r_g = 0;
end
S(index) = S(index) + value_of_r_g;
    end
    S(index) = S(index)/100;
p = p + 0.01;
index = index +1;
end

p = linspace(0,1,100);
plot(p,S,'LineWidth',2)
xlabel('p');
ylabel('\zeta');
title('characteristic lenght vs probability');


function [area,r_cm,r_g] = radiusofgyration(label,num)
%Calculates the radius of gyration 
area = zeros(num,1);
r_g = zeros(num,1);
r_cm = zeros(num,2);
% Find center of mass 
lablesize = size(label);
nx = lablesize(1);
ny = lablesize(2);
for i = 1:nx
for j = 1:ny
ilw = label(i,j);
if (ilw>0)
area(ilw) = area(ilw) + 1;
r_cm(ilw,:) = r_cm(ilw,:) + [i j];
end
end
end

r_cm(:,1) = r_cm(:,1)./area;
r_cm(:,2) = r_cm(:,2)./area;
% Find radius of gyration 
for i = 1:nx
for j = 1:ny
ilw = label(i,j);
if (ilw>0)
d_r = [i j]-r_cm(ilw,:);
d_r2 = dot(d_r,d_r);
r_g(ilw) = r_g(ilw) + d_r2;
end
end
end
r_g = r_g./area;
end

 