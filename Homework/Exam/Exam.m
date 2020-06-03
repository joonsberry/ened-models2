clear; clc; close all;

V = sym('60*t^4/Tf^5-120*t^3/Tf^4+60*t^2/Tf^3');
der1V = diff(V,'t');
crit_points = solve(der1V == 0,'t');
der2V = diff(der1V,'t');
t = crit_points;
der2V_crit = subs(der2V);

%%
clear; clc; close all;

ytop = sym('sqrt(169-x^2)');
ybottom = sym('-sqrt(25-x^2)+16');
area = double(2*int(ytop-12,'x',3,5) + int(ytop-ybottom,'x',-3,3));

%%
clear; clc; close all;

y = sym('x^4-12*x^3+48.25*x^2-71.25*x+25');
der1y = diff(y,'x');
AL = double(int(sqrt(1+der1y^2),'x',0,5));

%%
clear; clc; close all;

ytop = sym('1/3*x^2');
ybottom = sym('-1/16*(x-4)^2-2');
syms x;
area = 90.3681;
x_c = double(1/area*int(x*(ytop-ybottom),'x',-3,8));
y_c = double(1/(2*area)*int(ytop^2-ybottom^2,'x',-3,8));