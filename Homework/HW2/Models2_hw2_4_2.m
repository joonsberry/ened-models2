%Creator: Jonathan Kenney
%Models 2 Homework 2 Problem 3 (cont)
clear; clc; close all;

L1 = 5; L2 = 4;
t = 0:.1:10;
base = 30 - .0009684*t.^5 + .0242*t.^4 - .1614*t.^3;
joint = 20 + .0061*t.^5 - .1525*t.^4 + 1.0167*t.^3;

xj = L1*cosd(base);
yj = L1*sind(base);
xg = L1*cosd(base) + L2*cosd(base + joint);
yg = L1*sind(base) + L2*sind(base + joint);

figure(1)
for k = 1:length(t)
plot([0 xj(k)],[0 yj(k)],'k-o',[xj(k) xg(k)],[yj(k) yg(k)],'k-o');
axis([0 10 0 10])
pause(0.1);  % 0.1 was the increment in my time vector 
end
title('Articulated Arm Path')
ylabel('Horizontal Distance(m)');
xlabel('Vetical Distance(m)');