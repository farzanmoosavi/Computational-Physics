close all
clc

N = 1000000;
x = zeros(1,N);
y = zeros(1,N);

for i = 1:N
rand = randi([0 3]);    
    if rand == 0     %stem
        y(i+1) = 0.16*y(i);
    elseif  rand == 1   
        x(i+1) = 0.85*x(i) + 0.04*y(i);
        y(i+1) = -0.04*x(i) + 0.85*y(i) + 1.6;
    elseif rand == 2  
        x(i+1) = 0.2*x(i) - 0.26*y(i);
        y(i+1) = 0.23*x(i) + 0.22*y(i) + 1.6;
    else
        x(i+1) = -0.15*x(i) + 0.28*y(i);
        y(i+1) = 0.26*x(i) + 0.24*y(i) + 0.44;
    end
end
plot(x,y,'.')
legend(sprintf('the itteration is %s',N))