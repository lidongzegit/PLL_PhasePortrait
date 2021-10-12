%% 李东泽 2021-10-10
close all
clear
clc
%% 非理想二阶环相平面向量场
K = 1e3; % 环路增益
t1 = 50e-3; % 时间常数tau1
t2 = 10e-3; % 时间常数tau2
w0 = 0.4e3; % 中心频率差值
KH = K*t2/t1; % 高频总增益
Nmesh = 50;
xmin = pi-asin(w0/K)-pi/8;
xmax = pi-asin(w0/K)+pi/8;
ymin = -1/8;
ymax = 1/8;
[X,Y] = meshgrid(xmin:(xmax-xmin)/Nmesh:xmax,ymin:(ymax-ymin)/Nmesh:ymax);
Vx = Y.*KH.*KH;
Vy = w0./t1-(1./t1+K.*t2./t1.*cos(X)).*Y-K./t1.*sin(X);
VX = Vx./sqrt(Vx.^2+Vy.^2);
VY = Vy./sqrt(Vx.^2+Vy.^2);
quiver(X,Y,VX,VY,'color','k');
xlim([xmin xmax]);
ylim([ymin ymax]);
xlabel('$\theta_{e}$','Interpreter','latex');
ylabel('$\dot{\theta}_{e}^{\prime}$','Interpreter','latex');
title(gca,'非理想二阶环相平面向量场');

