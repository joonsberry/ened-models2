%Creator: Jonathan Kenney
%Models 2 HW 9

%% Problem 1
clear; clc; close all;

y1 = sym('sqrt(16-x^2)');
y2 = sym('(-sqrt(12)/4)*x^2+6+sqrt(12)');
area = double(int(y2-y1,'x',-2,2));
syms x;
x_c = 1/area*int(x*(y2-y1),'x',-2,2);
y_c = double(1/(2*area)*int(y2^2-y1^2,'x',-2,2));

%% Problem 2
clear; clc; close all;

y1 = sym('7/5*x');
y2 = sym('1/32*(x-2)^2+12');
area = double(int(y2-y1,'x',0,10));
syms x;
x_c = double(1/area*int(x*(y2-y1),'x',0,10));
y_c = double(1/(2*area)*int(y2^2-y1^2,'x',0,10));