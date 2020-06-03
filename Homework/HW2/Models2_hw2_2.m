%Creator: Jonathan Kenney
%Models 2 Homework 2 Problem 2
clear; clc; close all;

y_fcn = sym('y = -0.5*g*t^2 + V_0*sin(Th)*t + y_0');
x_fcn = sym('x = V_0*cos(Th)*t + x_0');
result = solve(x_fcn, y_fcn, 'V_0', 'Th');
g = 9.81; y_0 = 0; x_0 = 0; x = 1200; y = 1600; t = 10;
ansV_0 = double(subs(result.V_0)); ansTh = double(subs(result.Th));
angle = ansTh*180/pi;
disp(ansV_0);
disp(angle);

x = zeros(1,2001);
y = zeros(1,2001);
figure(1)
plot(1200, 1600, 'rx'); hold on;
for t = 0:.01:20
    x = 241.0434*cosd(60.1431)*(t);
    y = 241.0434*sind(60.1431)*(t) - 4.9*(t)^2;
    plot(x(t), y(t), 'b-'); hold on;
end