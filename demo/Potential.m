%% 李东泽 2021-10-10
close all
clear
clc
%% "等效势能"的可视化
K = 1e3; % 环路增益
t1 = 50e-3; % 时间常数tau1
t2 = 10e-3; % 时间常数tau2
w0 = 0.4e3; % 中心频率
KH = K*t2/t1; % 高频总增益

m = 1;
x = -3*pi:6*pi/10000:3*pi;
y = -m.*w0./t1.*x-K.*m./t1.*cos(x);
plot(x,y,'color','k');
xlabel('$\theta_{e}$','Interpreter','latex');
ylabel('$E_{p}$','Interpreter','latex');
xlim([-3*pi 3*pi]);