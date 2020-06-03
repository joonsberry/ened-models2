%Creator: Jonathan Kenney
%Models 2 Homework 2 Problem 3
clear; clc; close all;

f1 = sym('Th_f = Th_i + a1*Tf^5 + a2*Tf^4 + a3*Tf^3');
f2 = sym('0 = 5*a1*Tf^4 + 4*a2*Tf^3 + 3*a3*Tf^2');
f3 = sym('0 = 20*a1*Tf^3 + 12*a2*Tf^2 + 6*a3*Tf');
Tf = 10; Th_i = 20; Th_f = 121.67;
aEqns = solve(f1, f2, f3, 'a1', 'a2', 'a3');
double(subs(aEqns.a1)) 
double(subs(aEqns.a2)) 
double(subs(aEqns.a3))

t = 0:.1:10;
base = 30 - .0009684*t.^5 + .0242*t.^4 - .1614*t.^3;
joint = 20 + .0061*t.^5 - .1525*t.^4 + 1.0167*t.^3;
figure(1)
plot(t,base,'r-',t,joint,'b-');
xlabel('Time(s)','FontSize',14);
ylabel('Angle(degrees)','FontSize',14);
title('Angle vs. Time','FontSize',16);
legend('Base Angle','Joint Angle');


