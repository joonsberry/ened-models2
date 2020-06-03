%Creator: Jonathan Kenney
%Models 2 HW 8

%% Problem 1
clear; clc; close all;

y1 = sym('sqrt(16-x^2)');
y2 = sym('(-sqrt(12)/4)*x^2+6+sqrt(12)');

area = double(int(y2-y1,'x',-2,2));

%% Problem 2
clear; clc; close all;

y1 = sym('x^2/600');
y2 = sym('600*x^2/1000000');

AL1 = int(sqrt(1+diff(y1,'x')^2),'x',0,600);
AL2 = int(sqrt(1+diff(y2,'x')^2),'x',-1000,1000);

AL = double(2*AL1 + AL2);

%% Problem 3
clear; clc; close all;

y = sym('165-70.14*cosh(x/100)');

AL = double(int(sqrt(1+diff(y,'x')^2),-150,150));