clc 
close all
count = 0;

L = input('Enter the lattice size: ');
p = input ('Entre the probability: '); 

% 2D grid with size of lattice 
random_grid = rand(L,L);
% matrix numbers that are less than p same size as random_grid
z = random_grid < p;
% connecting the numbers
[label] = bwlabel(z,4) % label is name of the cluster   
figure(1)
axis =([0 L 0 L]);
   img = label2rgb(label','jet','w','shuffle');
   imagesc(img);
   
   %finding area of cluster
   %finding the color of spanning cluster
  for i = 1:L
      if count == 1
          break
      end
  for j = 1:L
  if label(i,1) == label(j,L) 
  if label(j,L) == 0
      continue
  end
   fprintf('there is spanning cluster in the network');
   k = (label(i,1));
   count = 1;
   figure(2) % showing the color
  imagesc(k);
  break
  end
  
  end
  end
 