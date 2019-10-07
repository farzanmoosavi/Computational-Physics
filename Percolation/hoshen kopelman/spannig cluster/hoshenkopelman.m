clc
close all
p = 0;
L = input('the lattice size is: ');
Q_inf = zeros(1,20);
index = 1;
while p <= 1
    
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
i = bwlabel(i,4);
% two sides of i arrays 
L_1 = i(1,:);
L_2 =  i(L,:);
%for size od cluster
s = regionprops(logical(i),'Area');
area = cat(2,s.Area);
% for cheking existing spannig cluster
for i = 1:L
    for j = 1:L
    if L_1(i) == L_2(j) && L_1(i) ~= 0
     %fprintf('there is spannig cluster');
    flag = 1;
    Q_inf(index) = max(area);
    end
    if flag == 1
        break
    end
    end
    if flag == 1
    break
    end
end

    end
    Q_inf(index) = Q_inf(index)/10;
p = p + 0.05;
index = index +1;
end
p = linspace(0,1,20);
plot(p,Q_inf,'LineWidth',2)
xlabel('p');
ylabel('Qinfinity');
title('sppaning cluster probability');

