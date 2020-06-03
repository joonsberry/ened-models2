%Creator: Jonathan Kenney
%Models 2 Homework 2 Problem 3
clear; clc; close all;

xj_fcn = sym('xj = L1*cos(Th1)');
yj_fcn = sym('yj = L1*sin(Th1)');
xg_fcn = sym('xg = L1*cos(Th1) + L2*cos(Th1 + Th2)');
yg_fcn = sym('yg = L1*sin(Th1) + L2*sin(Th1 + Th2)');
angles = solve(xg_fcn, yg_fcn, 'Th1', 'Th2');
L1 = 5; L2 = 4; xg = 2; yg = 4;
angle1 = double(subs(angles.Th1));
angle2 = double(subs(angles.Th2));
angle1 = angle1*180/pi;
angle2 = angle2*180/pi;
disp(angle1);
disp(angle2);
xj = L1*cosd(angle1(2));
yj = L1*sind(angle1(2));
plot([0 xj],[0 yj],'k-o',[xj xg],[yj yg],'k-o');
xlabel('Horizontal Distance (m)','FontSize',14);
ylabel('Vetical Distance (m)','FontSize',14);
title('Map of a Articulated Arm','FontSize',16);