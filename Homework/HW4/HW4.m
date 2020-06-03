%Creator: Jonathan Kenney
%HW4
clear; clc; close all;

%Problem 1
t = 0:.75:9.75;
th1 = 30 - .0009684*t.^5 + .02421*t.^4 - .1614*t.^3;
th2 = 20 + .0061002*t.^5 - .152505*t.^4 + 1.0167*t.^3;
est_Vth1 = zeros(1,14);
est_Vth2 = zeros(1,14);

for k = 2:14
    est_Vth1(k) = (th1(k) - th1(k-1))/(t(k)-t(k-1));
    est_Vth2(k) = (th2(k) - th2(k-1))/(t(k)-t(k-1));
end

Vth1 = -5*.0009684*t.^4 + 4*.02421*t.^3 - 3*.1614*t.^2;
Vth2 = 5*.0061002*t.^4 - 4*.152505*t.^3 + 3*1.0167*t.^2;
err_Vth1 = abs(est_Vth1 - Vth1);
err_Vth2 = abs(est_Vth2 - Vth2);

max_err_Vth1 = max(err_Vth1);
max_err_Vth2 = max(err_Vth2);

figure(1)
subplot(2,1,1)
plot(t,est_Vth1,'r*',t,Vth1,'k*');
xlabel('Time (s)');
ylabel('Angular Velocity (deg/s)')
title('Base Angular Velocity vs. Time');
legend('Estimate','Actual');
subplot(2,1,2)
plot(t,est_Vth2,'b*',t,Vth2,'k*');
xlabel('Time (s)');
ylabel('Angular Velocity (deg/s)')
title('Joint Angular Velocity vs. Time');
legend('Estimate','Actual');
figure(2)
plot(t,err_Vth1,'r*',t,err_Vth2,'b*');
xlabel('Time (s)');
ylabel('Absolute Error')
title('Base and Joint Velocity Estimate Error');
legend('Base','Joint');

fprintf('Max error for base: %.4f\n',max_err_Vth1);
fprintf('Max error for joint: %.4f\n',max_err_Vth2);

%%
%Problem 2
clear; clc; close all;

t = 0:.75:9.75;
th1 = 30 - .0009684*t.^5 + .02421*t.^4 - .1614*t.^3;
th2 = 20 + .0061002*t.^5 - .152505*t.^4 + 1.0167*t.^3;
est_Ath1 = zeros(1,14);
est_Ath2 = zeros(1,14);

for k = 2:13
    est_Ath1(k) = (th1(k+1) - 2*th1(k) + th1(k-1))/((t(k)-t(k-1))^2);
    est_Ath2(k) = (th2(k+1) - 2*th2(k) + th2(k-1))/((t(k)-t(k-1))^2);
end

Ath1 = -20*.0009684*t.^3 + 12*.02421*t.^2 - 6*.1614*t;
Ath2 = 20*.0061002*t.^3 - 12*.152505*t.^2 + 6*1.0167*t;
err_Ath1 = abs(est_Ath1 - Ath1);
err_Ath2 = abs(est_Ath2 - Ath2);

max_err_Ath1 = max(err_Ath1);
max_err_Ath2 = max(err_Ath2);

figure(1)
subplot(2,1,1)
plot(t,est_Ath1,'r*',t,Ath1,'k*');
xlabel('Time (s)');
ylabel('Angular Acceleration (deg/s^2)')
title('Base Angular Acceleration vs. Time');
legend('Estimate','Actual');
subplot(2,1,2)
plot(t,est_Ath2,'b*',t,Ath2,'k*');
xlabel('Time (s)');
ylabel('Angular Acceleration (deg/s^2)')
title('Joint Angular Acceleration vs. Time');
legend('Estimate','Actual');
figure(2)
plot(t,err_Ath1,'r*',t,err_Ath2,'b*');
xlabel('Time (s)');
ylabel('Absolute Error')
title('Base and Joint Acceleration Estimate Error');
legend('Base','Joint');

fprintf('Max error for base: %.4f\n',max_err_Ath1);
fprintf('Max error for joint: %.4f\n',max_err_Ath2);

%%
%Problem 3
clear; clc; close all;

dt = .75;
err_Vth2 = 1;
while max(err_Vth2) >= 1
    t = 0:dt:9.75;
    th2 = 20 + .0061002*t.^5 - .152505*t.^4 + 1.0167*t.^3;
    est_Vth2 = zeros(1,14);
    
    for k = 2:length(t)
        est_Vth2(k) = (th2(k) - th2(k-1))/dt;
    end
    
    Vth2 = 5*.0061002*t.^4 - 4*.152505*t.^3 + 3*1.0167*t.^2;
    err_Vth2 = abs(est_Vth2 - Vth2);
    dt = dt - .01;
end
disp(dt);

%%
%Problem 4
clear; clc; close all;

load HW4.mat;

th2 = 20 + .0061002*t.^5 - .152505*t.^4 + 1.0167*t.^3;
Vth2 = 5*.0061002*t.^4 - 4*.152505*t.^3 + 3*1.0167*t.^2;
Ath2 = 20*.0061002*t.^3 - 12*.152505*t.^2 + 6*1.0167*t;
est_Vth2 = zeros(1,length(t));
est_Ath2 = zeros(1,length(t));
for k = 2:length(t)
    est_Vth2(k) = (Th2_n(k) - Th2_n(k-1))/(t(k)-t(k-1));
end
for k = 2:length(t)-1
    est_Ath2(k) = (Th2_n(k+1) - 2*Th2_n(k) + Th2_n(k-1))/((t(k)-t(k-1))^2);
end

figure(1)
plot(t,Th2_n,'r*',t,th2,'k*');
xlabel('Time (s)');
ylabel('Angular Position (deg)');
title('Angular Postion vs. Time');
legend('Sensor','Actual');
figure(2)
plot(t,est_Vth2,'r*',t,Vth2,'k*');
xlabel('Time (s)');
ylabel('Angular Velocity (deg/s)');
title('Angular Velocity vs. Time');
figure(3)
plot(t,est_Ath2,'r*',t,Ath2,'k*');
xlabel('Time (s)');
ylabel('Angular Acceleration (deg/s^2)');
title('Angular Acceleration vs. Time');
legend('Sensor','Actual');