%Creator: Jonathan Kenney
%Models 2 Homework 2 Problem 2
clear; clc; close all;

t = 0:.1:20;
x = zeros(1,201);
y = zeros(1,201);
figure(1)
plot(1200, 1600, 'rx'); hold on;
for k = 1:201
    x(k) = 241.0434*cosd(60.1431)*(t(k));
    y(k) = 241.0434*sind(60.1431)*(t(k)) - 4.9*(t(k))^2;
    plot(x(k), y(k), 'bo'); hold on;
end
xlabel('Distance(m)','FontSize',14);
ylabel('Height(m)','FontSize',14);
title('Height vs. Distance','FontSize',16);
legend('Target','Trajectory');
figure(2)  % Opens new figure window
for k = 1:length(x)
plot(x(k),y(k),'ko',1200,1600,'r*');  
axis([0 1250 0 2000])
pause(0.01);  % 0.01 was the increment in my time vector 
end
title('Projectile Path')
ylabel('Projectile Height (m)');
xlabel('Projectile Range (m)');
