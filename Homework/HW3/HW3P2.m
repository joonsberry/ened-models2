%Creator: Jonathan Kenney
%HW3 P2
clear; clc; close all;

load HW3P2.mat;

interp_points = 0:.005:.8;

interp_spline = interp1(t,V,interp_points,'spline');

figure(1)
plot(t,V,'r*',interp_points,interp_spline,'ko');
xlabel('Time (sec)');
ylabel('Voltage (V)');
title('Voltage vs. Time Scatter');
legend('Original Data','Interpolated (Spline) Data');