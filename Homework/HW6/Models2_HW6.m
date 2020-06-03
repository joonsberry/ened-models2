%Creator: Jonathan Kenney
%Models 2: HW6
clear; clc; close all;

%Problem 2
load HW6.mat;

cubft_gal = 7.48052; %convert cubft <-> gal
r = 2; %ft
Level = zeros(1,length(t));
V = zeros(1,length(t));
dt = t(2)-t(1);

V(1) = 400; %gallons
Level(1) = (V(1)/cubft_gal)/(pi*r^2);

plot(t(1),Level(1),'k*'); 
xlabel('time (s)');
ylabel('Liquid Level in Tank (ft)'); 
title('Estimated Liquid Level');
axis([0 900 0 12]); grid;
hold on;

for k = 1:length(t)-1
   V(k+1) = V(k) + dt*(Flow_Rate(k+1) +...
       Flow_Rate(k))/2;
end

Level = (V/cubft_gal)/(pi*r^2);

for k = 2:length(t)
    plot(t(k),Level(k),'k*');
    xlabel('time (s)');
    ylabel('Liquid Level in Tank (ft)'); 
    title('Estimated Liquid Level');
    axis([0 900 0 12]); grid;
    hold on;
    if Level(k) > 9
        sound(yalarm,44100);pause(0.5);
    else
        pause(0.5);
    end
end
fprintf('Final level: %0.1f ft\n',Level(length(Level)));

%%
clear; clc; close all;
%Problem 3
g = 32.2; %ft/s^2
D = .1; %ft
r = 2; %ft

Level(1) = 9;
V(1) = pi*r^2*Level(1);
Flow_Rate(1) = pi*(D/2)^2*sqrt(2*g*(Level(1)-D/2));

DeltaT = input('DeltaT (s): ');

k = 1;
while Level(k) > .1
    k = k + 1;
    V(k) = V(k-1) - Flow_Rate(k-1)*DeltaT;
    Level(k) = V(k)/(pi*r^2);
    Flow_Rate(k) = pi*(D/2)^2*sqrt(...
        2*g*(Level(k)-D/2));
end

t = 0:DeltaT:(length(Level)-1)*DeltaT;
plot(t,Level,'k-');
xlabel('Time (s)');
ylabel('Level (ft)');
title('Level vs. Time');

fprintf('Final Liquid Level (ft): %0.3f\n',Level(length(Level)));
fprintf('Time Elapsed (s): %0.3f\n',(length(Level)-1)*DeltaT);