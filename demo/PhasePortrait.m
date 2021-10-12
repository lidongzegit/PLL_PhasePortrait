%% ��� 2021-10-10
close all
clear
clc
%% ��������׻���ƽ��ͼ���ݵļ���
K = 1e3; % ��·����
t1 = 50e-3; % ʱ�䳣��tau1
t2 = 10e-3; % ʱ�䳣��tau2
w0 = 0.4e3; % ����Ƶ�ʲ�ֵ
KH = K*t2/t1; % ��Ƶ������

% ������ʼ��������
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

%% ������ƽ��ͼ
figure(1)
for i = 1:size(IC,1)
    % ��ode���߽�΢�ַ���
    f = @(t,y) [y(2);w0/t1-(1/t1+K*t2/t1*cos(y(1)))*y(2)-K/t1*sin(y(1))];
    [t,y] = ode45(f,[0,0.2],[IC(i,1);KH.*IC(i,2)]);
    
    % ��ͼ1����ƽ��ͼ
    subplot(2,2,1)
    plot(y(:,1),y(:,2)./KH,'Color','k')
    hold on
    % ��ͼ2����ʱ�����ͼ
    subplot(2,2,2)
    plot3(y(:,1),y(:,2)./KH,t,'Color','k')
    hold on
    % ��ͼ3�������ʱ��Ĺ�ϵ
    subplot(2,2,3)
    plot(t,y(:,1),'Color','r')
    hold on
    % ��ͼ4�������ʱ��Ĺ�ϵ
    subplot(2,2,4)
    plot(t,y(:,2)./KH,'Color','r')
    hold on
end

% ͼ����ʾ����
subplot(2,2,1)
xlim([-pi 3*pi]);
ylim([-4 4]);
xlabel('$\theta_{e}$','Interpreter','latex');
ylabel('$\dot{\theta}_{e}^{\prime}$','Interpreter','latex');
title(gca,'��������׻���ƽ��ͼ');

subplot(2,2,2)
xlim([-pi 3*pi]);
ylim([-4 4]);
xlabel('$\theta_{e}$','Interpreter','latex');
ylabel('$\dot{\theta}_{e}^{\prime}$','Interpreter','latex');
zlabel('$t$','Interpreter','latex');
title(gca,'��ʱ�����ƽ��ͼ');

subplot(2,2,3)
xlim([0 0.2]);
ylim([-pi 3*pi]);
xlabel('$t$','Interpreter','latex');
ylabel('$\theta_{e}$','Interpreter','latex');
title(gca,'�����ʱ��ı仯');

subplot(2,2,4)
xlim([0 0.2]);
ylim([-4 4]);
xlabel('$t$','Interpreter','latex');
ylabel('$\dot{\theta}_{e}^{\prime}$','Interpreter','latex');
title(gca,'���仯����ʱ��ı仯');