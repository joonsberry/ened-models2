%Lab 3: Solving Nonlinear Equations using the Newton-Raphson Method
%Creator: Jonathan Kenney
%Part C
clear; clc; close all;

guess = 1000;

count = 0;

while abs(3*guess^(2/3)-2*guess+1000) > .0001 && count < 100
   if 5*guess^4 == 0
      guess = guess + .01;
   end
   guess = guess-(3*guess^(2/3)-2*guess+1000)/(2*guess^(-1/3)-2);
   count = count+1;
end

fprintf('Number of iterations: %i\n',count);
if abs(3*guess^(2/3)-2*guess+1000) <= .0001
    fprintf('Number to break even: %0.5f\n',guess);
else
    fprintf('The algorithm failed to converge.\n');
end