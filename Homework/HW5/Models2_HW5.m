%Creator: Jonathan Kenney
%Models 2: HW 5
clear; clc; close all;

%Problem 1
LV = sym('-r*w*sin(th)-(r^2*w*sin(2*th))/(2*L)');
r = .03; L = .5; w = 5*pi;
LV_th = subs(LV);
der1LV = diff(LV_th,'th');
crit_pts = double(solve(der1LV == 0,'th'));
crit_pts_deg = crit_pts*180/pi;
der2LV = diff(der1LV,'th');
th = crit_pts;
minmax = double(subs(der2LV));
LV_minmax = double(subs(LV));

THd = 0:360;
LV_nosym = -r*w*sind(THd)-r^2*w*sind(2*THd)/(.5*L);
plot(THd,LV_nosym,'k-');
xlabel('Crank Angle (degrees)');
ylabel('Linear Velocity (m/s)');
title('Linear Velocity vs. Crank Angle');

%%
%Problem 2
clear; clc; close all;

S = sym('W/(2*Z*L)*(L-x)*(.25*L-x)');
W = 15000; Z = .5; L = 40;
S_x = subs(S);
der1S = diff(S_x,'x');
crit_points = solve(der1S == 0,'x');
x = crit_points;
minStress = subs(S_x);

dist = 0:L;
stress = W/(2*Z*L)*(L-dist).*(.25*L-dist);
plot(dist,stress,'k-');
xlabel('Distance (m)');
ylabel('Stress (N/m^2)');
title('Stress vs. Distance');

%%
%Problem 3
clear; clc; close all;

y = sym('W/(48*El*In*L)*x^2*(L-x)*(3*L-2*x)');
W = 15000; El = 5*10^10; In = .25; L = 40;
y_x = subs(y);
der1y = diff(y_x,'x');
crit_points = double(solve(der1y == 0,'x'));
der2y = diff(der1y,'x');
x = crit_points; 
der2y_crit = subs(der2y);
ymax = double(subs(y_x));

dist = 0:L;
def = W/(48*El*In*L)*dist.^2.*(L-dist).*(3*L-2*dist);
plot(dist,def,'k-');
xlabel('Distance (m)');
ylabel('Deflection (m)');
title('Deflection vs. Distance');

%%
%Problem 4
clear; clc; close all;

L = input('Loan amount: ');
P = input('Monthly payment: ');
N = input('Number of payments: ');

r = .01; %initial guess

while abs(L*r-P*(1-1/(1+r)^N)) > .0001
   r = r - (L*r-P*(1-1/(1+r)^N))/(L-P*N/(1+r)^(N+1));
end
r = r*100;
fprintf('Monthly interest rate: %0.2f\n',r);
fprintf('Yearly interest rate: %0.2f\n',12*r);