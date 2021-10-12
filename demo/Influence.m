%% 李东泽 2021-10-10
close all
clear
clc
%% 寻找影响捕获时间的因素
%% 探究K的影响
K = 1e3; % 环路增益
t1 = 50e-3; % 时间常数tau1
t2 = 10e-3; % 时间常数tau2
w0 = 0.4e3; % 中心频率差值
KH = K*t2/t1; % 高频总增益
figure(1)
AK = [0.5e3 1e3 1.5e3 2e3];
for j = 1:4
    K = AK(j);
    IC = [];
    for i = 0:0.1:4
        ic = [-pi i];
        IC = [IC;ic];
    end
    for i = 0:0.1:4
        ic = [3*pi -i];
        IC = [IC;ic];
    end
    for i = 1:size(IC,1)
        f = @(t,y) [y(2);w0/t1-(1/t1+K*t2/t1*cos(y(1)))*y(2)-K/t1*sin(y(1))];
        [t,y] = ode45(f,[0,0.2],[IC(i,1);KH.*IC(i,2)]);
        subplot(2,2,j)
        plot(t,y(:,1),'Color','r')
        hold on
    end
    xlim([0 0.2]);
    ylim([-pi 3*pi]);
    xlabel('$t$','Interpreter','latex');
    ylabel('$\theta_{e}$','Interpreter','latex');
    title(gca,['当K=',num2str(K),'时']);
end
%% 探究t1的影响
K = 1e3; % 环路增益
t1 = 50e-3; % 时间常数tau1
t2 = 10e-3; % 时间常数tau2
w0 = 0.4e3; % 中心频率差值
KH = K*t2/t1; % 高频总增益
figure(2)
At1 = [25e-3 50e-3 75e-3 150e-3];
for j = 1:4
    t1 = At1(j);
    IC = [];
    for i = 0:0.1:4
        ic = [-pi i];
        IC = [IC;ic];
    end
    for i = 0:0.1:4
        ic = [3*pi -i];
        IC = [IC;ic];
    end
    for i = 1:size(IC,1)
        f = @(t,y) [y(2);w0/t1-(1/t1+K*t2/t1*cos(y(1)))*y(2)-K/t1*sin(y(1))];
        [t,y] = ode45(f,[0,0.2],[IC(i,1);KH.*IC(i,2)]);
        subplot(2,2,j)
        plot(t,y(:,1),'Color','r')
        hold on
    end
    xlim([0 0.2]);
    ylim([-pi 3*pi]);
    xlabel('$t$','Interpreter','latex');
    ylabel('$\theta_{e}$','Interpreter','latex');
    title(gca,['当t1=',num2str(t1),'时']);
end
%% 探究t2的影响
K = 1e3; % 环路增益
t1 = 50e-3; % 时间常数tau1
t2 = 10e-3; % 时间常数tau2
w0 = 0.4e3; % 中心频率差值
KH = K*t2/t1; % 高频总增益
figure(3)
At2 = [1e-3 5e-3 10e-3 25e-3];
for j = 1:4
    t2 = At2(j);
    IC = [];
    for i = 0:0.1:4
        ic = [-pi i];
        IC = [IC;ic];
    end
    for i = 0:0.1:4
        ic = [3*pi -i];
        IC = [IC;ic];
    end
    for i = 1:size(IC,1)
        f = @(t,y) [y(2);w0/t1-(1/t1+K*t2/t1*cos(y(1)))*y(2)-K/t1*sin(y(1))];
        [t,y] = ode45(f,[0,0.2],[IC(i,1);KH.*IC(i,2)]);
        subplot(2,2,j)
        plot(t,y(:,1),'Color','r')
        hold on
    end
    xlim([0 0.2]);
    ylim([-pi 3*pi]);
    xlabel('$t$','Interpreter','latex');
    ylabel('$\theta_{e}$','Interpreter','latex');
    title(gca,['当t2=',num2str(t2),'时']);
end
%% t2与t1同比例放缩的影响
K = 1e3; % 环路增益
t1 = 50e-3; % 时间常数tau1
t2 = 10e-3; % 时间常数tau2
w0 = 0.4e3; % 中心频率差值
KH = K*t2/t1; % 高频总增益
figure(4)
Ap = [0.1 1 5 10];
for j = 1:4
    t1 = Ap(j)*50e-3;
    t2 = Ap(j)*10e-3;
    IC = [];
    for i = 0:0.1:4
        ic = [-pi i];
        IC = [IC;ic];
    end
    for i = 0:0.1:4
        ic = [3*pi -i];
        IC = [IC;ic];
    end
    for i = 1:size(IC,1)
        f = @(t,y) [y(2);w0/t1-(1/t1+K*t2/t1*cos(y(1)))*y(2)-K/t1*sin(y(1))];
        [t,y] = ode45(f,[0,0.2],[IC(i,1);KH.*IC(i,2)]);
        subplot(2,2,j)
        plot(t,y(:,1),'Color','r')
        hold on
    end
    xlim([0 0.2]);
    ylim([-pi 3*pi]);
    xlabel('$t$','Interpreter','latex');
    ylabel('$\theta_{e}$','Interpreter','latex');
    title(gca,['当t1和t2同时变为原来的',num2str(Ap(j)),'倍时']);
end
%% t2与K反比例放缩的影响
K = 1e3; % 环路增益
t1 = 50e-3; % 时间常数tau1
t2 = 10e-3; % 时间常数tau2
w0 = 0.4e3; % 中心频率差值
KH = K*t2/t1; % 高频总增益
figure(5)
Ap = [0.1 1 5 10];
for j = 1:4
    K = 1e3./Ap(j);
    t2 = Ap(j)*10e-3;
    IC = [];
    for i = 0:0.1:4
        ic = [-pi i];
        IC = [IC;ic];
    end
    for i = 0:0.1:4
        ic = [3*pi -i];
        IC = [IC;ic];
    end
    for i = 1:size(IC,1)
        f = @(t,y) [y(2);w0/t1-(1/t1+K*t2/t1*cos(y(1)))*y(2)-K/t1*sin(y(1))];
        [t,y] = ode45(f,[0,0.2],[IC(i,1);KH.*IC(i,2)]);
        subplot(2,2,j)
        plot(t,y(:,1),'Color','r')
        hold on
    end
    xlim([0 0.2]);
    ylim([-pi 3*pi]);
    xlabel('$t$','Interpreter','latex');
    ylabel('$\theta_{e}$','Interpreter','latex');
    title(gca,['当t2变为原来的',num2str(Ap(j)),'倍时']);
end