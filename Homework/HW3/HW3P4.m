%Creator: Jonathan Kenney
%HW3 P4
clear; clc; close all;

load HW3P4.mat;

figure(1)
plot(t,pos,'ko');
xlabel('Time (sec)');
ylabel('Position (mm)');
title('Position vs. Time Scatter');

v_est = zeros(1,41);

for k = 2:41
    v_est(k) = (pos(k)-pos(k-1))/(t(k)-t(k-1));
end

figure(2)
plot(t,v_est,'ko',t_act,v_act,'r-');
xlabel('Time (sec)');
ylabel('Velocity (mm/sec)');
title('Velocity vs. Time');
legend('Estimated Velocity','Actual Velocity');