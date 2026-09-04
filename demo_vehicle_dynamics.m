clear; clc; close all;
addpath(genpath('../src'));

%% Tire model comparison
alpha = deg2rad(linspace(-12,12,300));
Fz = 4000;

FyLin = linear_tire_model(alpha,70000);

pacejka.B = 8;
pacejka.C = 1.3;
pacejka.D = 1.0;
pacejka.E = 0.95;
FyMF = magic_formula_tire(alpha,Fz,pacejka);

figure;
plot(rad2deg(alpha),FyLin,'LineWidth',1.2); hold on;
plot(rad2deg(alpha),FyMF,'--','LineWidth',1.2);
grid on;
xlabel('Slip angle [deg]');
ylabel('Lateral force [N]');
legend('Linear tire','Magic Formula');
title('Generic Tire-Model Comparison');

%% Linear bicycle model
veh.m = 1500;
veh.Iz = 2500;
veh.lf = 1.2;
veh.lr = 1.6;
veh.Cf = 70000;
veh.Cr = 70000;

[A,B,C,D] = linear_bicycle_model(veh,15);
sys = ss(A,B,C,D);

t = 0:0.01:5;
delta = deg2rad(3)*ones(size(t));
y = lsim(sys,delta,t);

figure;
plot(t,y(:,2),'LineWidth',1.2);
grid on;
xlabel('Time [s]');
ylabel('Yaw rate [rad/s]');
title('Linear Bicycle Model - Step Steering');

%% Generic ABS slip-control demonstration
dt = 0.001;
t = 0:dt:4;

pAbs.m = 350;
pAbs.J = 1.2;
pAbs.R = 0.30;
pAbs.Fz = pAbs.m*9.81;
pAbs.c1 = 1.28;
pAbs.c2 = 23.99;
pAbs.c3 = 0.52;

pd.lambdaRef = 0.18;
pd.Kp = 3000;
pd.Kd = 40;
pd.bias = 800;
pd.Tmin = 0;
pd.Tmax = 2500;

x = [25;25/pAbs.R];
state.prevError = 0;

vLog = zeros(size(t));
wLog = zeros(size(t));
lambdaLog = zeros(size(t));
TbLog = zeros(size(t));

for k = 1:numel(t)
    v = max(x(1),0);
    omega = max(x(2),0);
    lambda = (v-pAbs.R*omega)/max(v,0.5);
    lambda = min(max(lambda,0),1);

    [Tb,state] = pd_abs(lambda,dt,state,pd);
    dx = quarter_car_model(0,x,Tb,pAbs);
    x = x + dt*dx;
    x = max(x,0);

    vLog(k) = x(1);
    wLog(k) = x(2)*pAbs.R;
    lambdaLog(k) = lambda;
    TbLog(k) = Tb;

    if x(1) <= 0.05
        vLog(k:end) = 0;
        wLog(k:end) = 0;
        lambdaLog(k:end) = lambdaLog(k);
        TbLog(k:end) = 0;
        break
    end
end

figure;
plot(t,vLog,'LineWidth',1.2); hold on;
plot(t,wLog,'--','LineWidth',1.2);
grid on;
xlabel('Time [s]');
ylabel('Speed [m/s]');
legend('Vehicle speed','Wheel peripheral speed');
title('Generic Quarter-Car ABS Example');
