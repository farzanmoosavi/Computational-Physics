
L = 100;
p = 0.592;
allr_g = [];
allarea = [];

z = rand(L,L);
m = z<p;
[lw,num] = bwlabel(m,4);
[area,rcm,rad2] = radiusofgyration(lw,num);
allr_g = cat(1,allr_g,rad2);
allarea = cat(1,allarea,area);
x = [allr_g allarea];
figure
loglog(allr_g,allarea,'k.')
xlswrite('myFile.xlsx',x);

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