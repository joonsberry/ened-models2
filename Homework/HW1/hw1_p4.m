%Creator: Jonathan Kenney
%Models 2 HW1 Problem 4

clear; clc; close all;

A = [sin(25) -cos(35); cos(25) sin(35)];
b = [0 120];

det(A)

b*inv(A)