%% 李东泽 2021-10-10
close all
clear
clc
%% 非理想二阶环相平面图数据的计算
K = 1e3; % 环路增益
t1 = 50e-3; % 时间常数tau1
t2 = 10e-3; % 时间常数tau2
w0 = 2e3; % 中心频率差值
KH = K*t2/t1; % 高频总增益

% 建立初始条件矩阵
IC = [];
for i = 0:0.1:6
    ic = [-pi i];
    IC = [IC;ic];
end
for i = 0:0.1:6
    ic = [3*pi -i];
    IC = [IC;ic];
end
ic = [pi-asin(w0/K) +1e-9];
IC = [IC;ic];
ic = [pi-asin(w0/K) -1e-9];
IC = [IC;ic];

%% 绘制相平面图
figure(1)
for i = 1:size(IC,1)
    % 用ode工具解微分方程
    f = @(t,y) [y(2);w0/t1-(1/t1+K*t2/t1*cos(y(1)))*y(2)-K/t1*sin(y(1))];
    [t,y] = ode45(f,[0,0.2],[IC(i,1);KH.*IC(i,2)]);
    
    plot(y(:,1),y(:,2)./KH,'Color','k')
    hold on
end

% 图形显示设置
xlim([-pi 3*pi]);
ylim([-4 4]);
xlabel('$\theta_{e}$','Interpreter','latex');
ylabel('$\dot{\theta}_{e}^{\prime}$','Interpreter','latex');
title(gca,'非理想二阶环相平面图（失锁状态）');