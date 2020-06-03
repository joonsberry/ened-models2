%Creator: Jonathan Kenney
%Models 2 HW 7
clear; clc; close all;

%Problem 1

f1 = sym('(x+5)^2+(y-3)^2=25');
yt = solve(f1,'y');
f2 = sym('(x+5)^2/16+y^2/25=1');
yb = solve(f2,'y');

A = double(int(yt(1)-yb(1),'x',-9,-1));

%%
clear; clc; close all;

%Problem 2

yt = sym('x^2*-15/2048 + 15');
yb = sym('x^2*15/2048');
A = int(yt-yb,'x',-32,24);

%%
clear; clc; close all;

%Problem 3

y = sym('x^2*-.072');
A = .8*(10*.6*.8-int(y,'x',-5,5));