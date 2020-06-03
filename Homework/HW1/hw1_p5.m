%Creator: Jonathan Kenney
%Models 2 HW1 Problem 4

clear; clc; close all;

A = [6.8 -3.6 -1 0; -3.6 14.7 0 -1.1; -1 0 11.3 -4.7; 0 -1.1 -4.7 12.6];
b = [0 -15 9 0];

det(A)

b*inv(A)