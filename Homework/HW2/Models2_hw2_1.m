%Creator: Jonathan Kenney
%Models 2 Homework 2 Problem 1
clear; clc; close all;

height_fcn = sym('0 = -0.5*g*t^2 + V_0*sin(Th)*t + y_0')
time_fcn = solve(height_fcn, 't')