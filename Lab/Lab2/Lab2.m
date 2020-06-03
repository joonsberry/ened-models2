%Creator: Jonathan Kenney
%Section 010
%Lab 2: Estimating Velocity and Acceleration Using GPS Data
clear; clc; close all;

load GPS_Data2.mat;

dist = zeros(1,7);
pos = zeros(1,7);
vel_2pt = zeros(1,7);
vel2pt_error = zeros(1,7);
vel_3pt = zeros(1,6);
vel3pt_error = zeros(1,6);
acc_est = zeros(1,6);
acc_error = zeros(1,6);

dt = (60*60*hour(2)+60*minute(2)+second(2))-(60*60*hour(1)+60*minute(1)+second(1));

t = 0:dt:dt*26;
t_less = 0:dt:dt*25;

for k = 2:length(actual_velocity)
    dist(k) = 222240*asind(sqrt(sind((latitude(k)-latitude(k-1))/2)^2+cosd(latitude(k-1))*cosd(latitude(k))*sind((longitude(k)-longitude(k-1))/2)^2));
    pos(k) = pos(k-1)+dist(k);
    vel_2pt(k) = (pos(k)-pos(k-1))/dt;
    vel2pt_error(k) = abs(vel_2pt(k)-actual_velocity(k));
end

for k = 2:length(actual_acceleration)
    vel_3pt(k) = (pos(k+1)-pos(k-1))/(2*dt);
    vel3pt_error(k) = abs(vel_3pt(k)-actual_velocity(k));
    acc_est(k) = (pos(k+1)-2*pos(k)+pos(k-1))/dt^2;
    acc_error(k) = abs(acc_est(k)-actual_acceleration(k));
end

figure(1)
subplot(2,1,1)
plot(t_less,vel_3pt,'r*',t,actual_velocity,'k-');
xlabel('time (sec)');
ylabel('Velocity (m/s)');
title('Estimated Velocity');
legend('Estimated','Actual');
subplot(2,1,2)
plot(t_less,vel3pt_error,'r*');
xlabel('time (sec)');
ylabel('Abs Error (m/s)');
title('Estimation Error');

figure(2)
subplot(2,1,1)
plot(t_less,acc_est,'r*',t_less,actual_acceleration,'k-');
xlabel('time (sec)');
ylabel('Acceleration (m/s^2)');
title('Estimated Acceleration');
legend('Estimated','Actual');
subplot(2,1,2)
plot(t_less,acc_error,'r*');
xlabel('time (sec)');
ylabel('Abs Error (m/s)');
title('Estimation Error');