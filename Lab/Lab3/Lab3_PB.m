%Lab 3: Solving Nonlinear Equations using the Newton-Raphson Method
%Creator: Jonathan Kenney
%Part B
clear; clc; close all;

number = input('Number for desired 5th root: ');
guess = input('Initial guess: ');

count = 0;
plot(count,guess,'r*'); hold on;

while abs(guess^5-number) > .0001 && count < 100
   if 5*guess^4 == 0
      guess = guess + .01;
   end
   guess = guess-(guess^5-number)/(5*guess^4);
   count = count+1;
   plot(count,guess,'r*'); hold on;
end
xlabel('Iterations (0 is initial guess)');
ylabel('Estimate of 5th Root');
title('Estimation of 5th Root by Newton-Raphson Method');

fprintf('Number of iterations: %i\n',count);
if abs(guess^5-number) <= .0001
    fprintf('Estimate for 5th root of %0.5f: %0.5f\n',number,guess);
else
    fprintf('The algorithm failed to converge.\n');
end