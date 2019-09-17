close all
clc

N = 100000;
x = random('Normal',0.5,0.4,1,N); %0.5 is mean and 0.4 is standard diviation
y = random('Normal',0.5,0.4,1,N); %0.5 is mean and 0.4 is standard diviation
for i = 1:N
rand = randi([0 2]);    
    if rand == 0    
        x(i+1) = 0.5*x(i);
        y(i+1) = 0.5*y(i);
    elseif  rand == 1
        x(i+1) = 0.5*x(i) + .25;
        y(i+1) = 0.5*y(i) + sqrt(3)/4;
    else
        x(i+1) = 0.5*x(i) + .5;
        y(i+1) = 0.5*y(i);
    end
end
plot(x,y,'.')
legend(sprintf('the itteration is %s',N))