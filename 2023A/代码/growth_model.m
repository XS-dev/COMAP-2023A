clc
clear all
I=0:0.1:10;
ph=7; 
p=20; %so2
Ryear=200; %降水量
Q(1)=5; %第一周生物质总量
d=0.001; %死亡率相关
k1=0.005; %ph值相关
k2=0.001; %so2相关
k3=0.05; %生长率相关
theta1=20; %标准差
theta2=20; %
if Ryear<=400
    deltaT=-0.48.*(400+Ryear)./400-0.28;
elseif Ryear<=800
    deltaT=-0.62.*(400+Ryear)./400;
else
    deltaT=-0.86.*Ryear./400-0.14;
end
for t=2:200
    G1(t)=1+10/(theta1.*(2.*pi)^(1/2)).*exp(-(t-50).^2./(2*theta1^2));
    G2(t)=1-10/(theta2.*(2.*pi)^(1/2)).*exp(-(t-50).^2./(2*theta2^2));
% G1(t)=1;
% G2(t)=1;
    T(t)=37+deltaT;
    alpha(t)=0.1-exp(-260./Q(t-1)); %反照度
    beta(t)= 1./(1+exp(-Q(t-1)/300));%土壤含水量系数
    gamma(t)=1./1+(exp(-T(t).*Q(t-1)./(T(t)+10))); %大气湿度系数
%     T(t)=37;
%     alpha(t)=0; %反照度
%     beta(t)= 1;%土壤含水量系数
%     gamma(t)=1; %大气湿度系数
    phi(t)=10*(1-alpha(t));
    SH(t)=60.*beta(t);
    RH(t)=50.*gamma(t);
    APD(t)=0.6111.*exp((17.27.*T(t)./(237.3+T(t)))).*(1-RH(t));
    if Ryear>200
        vp(t)=photos1(-APD(t).*phi(t)./700);
    else
        vp(t)=photos2(SH(t).*phi(t)./136);
    end
    h(t)=G2(t).*(k1.*(ph-7)^2+k2.*p)+Q(t-1).*d;
    f(t)=G1(t).*k3.*(vp(t)+0.1.*vp(t));
    Q(t)=Q(t-1)+Q(t-1).*(f(t)-h(t));
end
%[t,x]=ode45(@shier1,ts,x0);[t,x],
% y1=x(:,1);
% y2=x(:,2);
t=[1:1:200];
plot(t,Q,'-r'),grid on,legend('x(t)','y(t)');
%plot(t,y1,'-r',t,y2,'-b'),grid on,legend('x(t)','y(t)');
xlabel('Time') % 在当前图形的x轴做标注
ylabel('Q') % 在当前图形的y轴做标注
hold on;
% figure;
% plot(x(:,1),x(:,2)),grid on,
% xlabel('x(t)') % 在当前图形的x轴做标注
% ylabel('y(t)') % 在当前图形的y轴做标注
Rt=1:1:100;
b=1:1:100;
for i=1:1:100
    b(i)=i;
    N=i;
k=0.17;
r1=0.105;
r2=0.105;
K1=round(k*N)*130.88/N;
K2=Q(200)*round((1-k)*N)/N;
s1=-(N-1)*0.04*(1./(exp(-(600-Ryear)./40)+1)-3/4);
s2=-(N-1)*0.04*(1./(exp(-(600-Ryear)./40)+1)-3/4);
N10=round(k*N)*130.88/N;
N20=round((1-k)*N)*130.88/N;
t0=0;
tf=30;
dt=1;
[t, N1, N2] = population_competition(r1, r2, K1, K2, s1, s2, N10, N20, t0, tf, dt);
N3=N1+N2;
%figure
%plot(t, N1, t, N2, t, N3,'LineWidth', 3), grid on, xlabel('t'), ylabel('N'), legend('N1', 'N2','N');
Rt(i)=-130.88*200/(N3(30)-130.88);
end
figure 
plot(b,Rt,'.r-');


























































