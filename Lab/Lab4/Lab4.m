%Creator: Jonathan Kenney
%Models 2: Lab 4
clear; clc; close all;

load Lab4.mat;

Data.Power = 120*Data.Current;
Data.DeltaT = Data.Second;
Data.DeltaT(1) = 0;
Data.DeltaT(2:length(Data.DeltaT)) = (Data.Min(2:length(Data.Min))*60 + Data.Second(2:length(Data.Second))) - (Data.Min(1:length(Data.Min)-1)*60 + Data.Second(1:length(Data.Second)-1));

neg_elem = find(Data.DeltaT < 0);
Data.DeltaT(neg_elem) = Data.DeltaT(neg_elem) + 3600;

Data.Energy = Data.Second;
Data.Energy(1) = 0;
Data.Energy(2:length(Data.Energy)) = (Data.Power(2:length(Data.Power)) + Data.Power(1:length(Data.Power)-1)).*Data.DeltaT(2:length(Data.DeltaT))/2;
Data.Energy = Data.Energy/(60*60*1000);

sept15 = find(Data.Month == 9 & Data.Day == 15);

hourly_energy = zeros(1,24);
for k = 1:24
    hour = find(Data.Month == 9 & Data.Day == 15 & Data.Hour == k-1);
    hourly_energy(k) = sum(Data.Energy(hour));
end
plot(0:23,hourly_energy,'r*');
xlabel('Hour (military)');
ylabel('Energy Usage (kWh)');
title('Energy Usage on 09/15');

daily_energy = zeros(1,31);
for k = 1:18
    day = find(Data.Month == 9 & Data.Day == 12+k);
    daily_energy(k) = sum(Data.Energy(day));
end
for k = 1:13
    day = find(Data.Month == 10 & Data.Day == k);
    daily_energy(k+18) = sum(Data.Energy(day));
end
plot(0:30,daily_energy,'r*');
xlabel('Days since 09/13');
ylabel('Energy Usage (kWh)');
title('Energy Usage from 09/13 to 10/13');