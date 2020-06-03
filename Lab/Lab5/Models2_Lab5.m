%Creator: Jonathan Kenney
%Models 2: Lab 5
clear; clc; close all;

%Part C
load Submarine_Hatch.mat;

figure(1)
plot(x_left,y_hatch,'k-',x_right,y_hatch,'k-');
axis([-1 1 -2 0]);
xlabel('Width (m)');
ylabel('Height (m)');
title('Sub Hatch Visual');

depth = input('Depth: ');
p = 1027; g = 9.81;
total_out = 0;
total_in = 0;

for k = 2:length(y_hatch)
   total_out = total_out + (101353 + p*g*(depth - y_hatch(k-1)))*...
       ((x_right(k)-x_left(k))+(x_right(k-1)-...
       x_left(k-1)))/2*(y_hatch(k-1)-y_hatch(k));
end

for k = 2:length(y_hatch)
   total_in = total_in + 101353*...
       ((x_right(k)-x_left(k))+(x_right(k-1)-...
       x_left(k-1)))/2*(y_hatch(k-1)-y_hatch(k));
end

netF = total_out - total_in;

if netF > 5000000
    depth_safe = 'No';
else
    depth_safe = 'Yes';
end

fprintf('Outside force: %i N\n',total_out);
fprintf('Inside force: %i N\n',total_in);
fprintf('Net force: %i N\n',netF);
fprintf('Can the sub reach this depth safely? %s\n',depth_safe);

%%
clear; clc; close all;

%Part D
load Airplane_Hatch.mat;

h = input('Altitude: ');
g = 9.81;
total_out = 0;
total_in = 0;
p_ext = 101353*(1-.0000225577*h)^5.25588;

for k = 2:length(y_hatch)
   total_out = total_out + p_ext*...
       ((x_right(k)-x_left(k))+(x_right(k-1)-...
       x_left(k-1)))/2*(y_hatch(k-1)-y_hatch(k));
end

for k = 2:length(y_hatch)
   total_in = total_in + 101353*...
       ((x_right(k)-x_left(k))+(x_right(k-1)-...
       x_left(k-1)))/2*(y_hatch(k-1)-y_hatch(k));
end

netF = total_in - total_out;

if netF > 350000
    altitude_safe = 'No';
else
    altitude_safe = 'Yes';
end

fprintf('Exterior pressure: %i (N/m^2)\n',p_ext);
fprintf('Outside force: %i N\n',total_out);
fprintf('Inside force: %i N\n',total_in);
fprintf('Net force: %i N\n',netF);
fprintf('Can the sub reach this altitude safely? %s\n',altitude_safe);