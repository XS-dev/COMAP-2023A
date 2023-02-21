clc
clear all
I=0:0.1:10;
ph=7; 
p=20; %so2
Ryear=600; %降水量
Q(1)=7200; %第一周生物质总量
d=0.001; %死亡率相关
k1=0.005; %ph值相关
k2=0.001; %so2相关


k33=[-5397.06869	-5421.109013	-5710.049923	-4877.183921	-4664.703985	-5000.255458	-5474.7468	-5615.991418	-5887.486352	-5387.008978	-5130.175601	-4887.262778	-5293.521912]; %生长率相关
k31=[642.147527213199,708.881862585287,671.458929287668,671.797270305606,670.158321058746,715.333298765564,713.049895766768,730.072925490723,561.489831506271,655.590019078217,541.657865161800,651.437405298085,707.214820534002];
k32=[1236.41423918498,1131.61486673212,1017.24106987088,847.983438797626,628.801872963163,625.255213118625,659.114240121925,898.743091658450,957.155663239176,1102.13277451628,1214.84528607011,1243.40066914061,989.803662467848];   

theta1=20; %标准差
theta2=20; %
if Ryear<=400
    deltaT=-0.48.*(400+Ryear)./400-0.28;
elseif Ryear<=800
    deltaT=-0.62.*(400+Ryear)./400;
else
    deltaT=-0.86.*Ryear./400-0.14;
end
T0=24+deltaT;
for t=2:120
    G1(t)=1+10/(theta1.*(2.*pi)^(1/2)).*exp(-(t-50).^2./(2*theta1^2));
    G2(t)=1-10/(theta2.*(2.*pi)^(1/2)).*exp(-(t-50).^2./(2*theta2^2));
% G1(t)=1;
% G2(t)=1;
    T(t)=T0;
    alpha(t)=0.1-exp(-260./Q(t-1)); %反照度
    beta(t)= 1./(1+exp(-Q(t-1)/300));%土壤含水量系数
    gamma(t)=1./1+(exp(-abs(-T(t).*Q(t-1)./(T(t)+10)))); %大气湿度系数
%     T(t)=37;
%     alpha(t)=0; %反照度
%     beta(t)= 1;%土壤含水量系数
%     gamma(t)=1; %大气湿度系数
    phi(t)=10*(1-alpha(t));
    SH(t)=60.*beta(t);
    RH(t)=50.*gamma(t);
    APD(t)=0.6111.*exp(17.27.*T(t)./(237.3+T(t))).*(1-RH(t));
    if Ryear>200
        vp(t)=photos1(-abs(APD(t)).*phi(t)/332);
    else
        vp(t)=photos2(abs((SH(t)-100).*SH(t)+2501).*phi(t)./1);
    end
    test=abs((APD(t)-600).*APD(t)+90000).*phi(t)./634113;
    h(t)=G2(t).*(k1.*(ph-7)^2+k2.*p)+Q(t-1).*d;
end
%[t,x]=ode45(@shier1,ts,x0);[t,x],
% y1=x(:,1);
% y2=x(:,2);
t=[1:1:120];
figure;
plot(t,Q,'-r'),grid on,legend('x(t)','y(t)');
hold on;
plot(t,Q,'-r'),grid on,legend('x(t)','y(t)');
hold on;
plot(t,Q,'-r'),grid on,legend('x(t)','y(t)');
%plot(t,y1,'-r',t,y2,'-b'),grid on,legend('x(t)','y(t)');
xlabel('Time') % 在当前图形的x轴做标注
ylabel('Q') % 在当前图形的y轴做标注
hold on;
% figure;
% plot(x(:,1),x(:,2)),grid on,
% xlabel('x(t)') % 在当前图形的x轴做标注
% ylabel('y(t)') % 在当前图形的y轴做标注