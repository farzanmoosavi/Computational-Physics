clc 
close all


L = input('Enter the lattice size: ');
p = input ('Entre the probability: '); 

% 2D grid with size of lattice 
random_grid = rand(L,L);
% matrix numbers that are less than p same size as random_grid
z = random_grid < p;
figure
axis =([0 L 0 L]);
   img = (z);
   
   imagesc(img);
   