clc
clear all
I=0:0.1:100;
x0=[25,2];
%[t,x]=ode45(@shier1,ts,x0);[t,x],
% I1=20;
% x=1/(I1.*(2.*pi)^(1/2)).*exp(-(I-50).^2./(2*I1^2));

%澳大利亚
T1=[37.65285714	33.24821429	30.58071429	25.15238095	17.82845238	13.76928571	14.24083333	16.37	23.14333333	27.19809524	31.63428571	34.21821429];
RH1=[22.29771084	24.64084337	27.7760241	32.84192771	40.47373494	46.65072289	44.27048193	37.32433735	24.1946988	24.33927711	17.99228916	22.96180723];
SH1=[0.173975904	0.18253012	0.192289157	0.197831325	0.190843373	0.187108434	0.183855422	0.18626506	0.180722892	0.182891566	0.179036145	0.184216867];
W1=[28.79880952	28.76857143	24.17404762	20.45547619	16.55785714	15.33380952	16.10666667	19.5602381	23.20714286	26.93547619	30.105	28.37047619];
R1=[40	32	21	12	7	6	4	9	13	21	23	34];
APD1=0.6111.*exp((17.27.*T1./(237.3+T1))).*(1-RH1).*W1;
K1=RH1.*W1;

%南非
T2=[27.86946429	27.74767857	24.16125	17.88571429	14.44285714	10.21303571	9.507321429	10.28375	15.56303571	19.40482143	23.05928571	25.91089286];
RH2=[40.16660714	42.30053571	44.08821429	47.80160714	45.57125	51.71214286	49.86678571	52.59982143	45.55017857	42.21517857	40.78910714	39.07125];
SH2=[0.349107143	0.353928571	0.353392857	0.353928571	0.360892857	0.368214286	0.387142857	0.392857143	0.386964286	0.37375	0.358928571	0.348392857];
W2=[30.78214286	26.75178571	23.07285714	17.73964286	13.79821429	12.09107143	13.2175	17.08642857	21.01321429	26.1075	29.78357143	31.82392857];
R2=[21	16	15	13	12	14	11	4	13	9	6	12];
APD2=0.6111.*exp((17.27.*T2./(237.3+T2))).*(1-RH2).*W2;
K2=RH2.*W2;

%亚马逊热带雨林
T3=[26.4715	26.83192857	26.942	26.41792857	26.29892857	26.17757143	26.11678571	27.05178571	27.85407143	27.03621429	26.79485714	26.44085714];
RH3=[91.01	90.38621429	90.41585714	91.84271429	92.30992857	91.56871429	89.64371429	84.55235714	82.60014286	86.55578571	88.618	90.73142857];
SH3=[0.805785714	0.821142857	0.8355	0.922142857	0.962642857	0.941928571	0.882285714	0.761285714	0.680285714	0.698357143	0.739857143	0.786214286];
W3=[17.33985714	17.17071429	17.96342857	15.575	14.92457143	16.245	18.23814286	18.786	19.24128571	17.61414286	16.61328571	15.77914286];
R3=[221	214	304	334	328	129	76	49	72	119	116	192];
APD3=0.6111.*exp((17.27.*T3./(237.3+T3))).*(1-RH3).*W3;




figure;
scatter3(T1,RH1,APD1,'b');
hold on;
scatter3(T2,RH2,APD2,'g');
hold on;
scatter3(T3,RH3,APD3,'r');
xlabel('Tempreture(℃)') % 在当前图形的x轴做标注
ylabel('Relative humidity(%)') % 在当前图形的y轴做标注
zlabel('Water vapor pressure deficit(kPa)') % 在当前图形的x轴做标注

figure;
scatter3(W1,SH1,K1,'b');
hold on;
scatter3(W2,SH2,K2,'g');
hold on;
xlabel('Solar radiant energy(MJ)') % 在当前图形的x轴做标注
ylabel('Relative humidity(%)') % 在当前图形的y轴做标注
zlabel('') % 在当前图形的x轴做标注

% y1=x(:,1);
% y2=x(:,2);
% a=(APD(10)-APD(1))./(T(10)-T(1));
% plot(T,APD,'-r'),grid on,legend('x(t)','y(t)');
%plot(t,y1,'-r',t,y2,'-b'),grid on,legend('x(t)','y(t)');
hold on;
% figure;
% plot(x(:,1),x(:,2)),grid on,
% xlabel('x(t)') % 在当前图形的x轴做标注
% ylabel('y(t)') % 在当前图形的y轴做标注

figure;
T1=smooth(T1,5,'rloess');
T2=smooth(T2,5,'rloess');
T3=smooth(T3,5,'rloess');
x=[1:1:12];
plot(x,T1,x,T2,x,T3);
xlabel('Time(month)') % 在当前图形的x轴做标注
ylabel('Tempreture(℃)') % 在当前图形的y轴做标注
legend('witjira national park,Central Australia','Karoo National Park,South Africa','Jau National Park,Amazon Rainforest')
figure;
RH1=smooth(RH1,3,'rloess');
RH2=smooth(RH2,3,'rloess');
RH3=smooth(RH3,3,'rloess');
plot(x,RH1,x,RH2,x,RH3);
xlabel('Time(month)') % 在当前图形的x轴做标注
ylabel('RH(%)') % 在当前图形的y轴做标注
legend('witjira national park,Central Australia','Karoo National Park,South Africa','Jau National Park,Amazon Rainforest')
figure;
SH1=smooth(SH1,5,'rloess');
SH2=smooth(SH2,5,'rloess');
SH3=smooth(SH3,5,'rloess');
plot(x,SH1*100,x,SH2*100,x,SH3*100);
xlabel('Time(month)') % 在当前图形的x轴做标注
ylabel('SH(%)') % 在当前图形的y轴做标注
legend('witjira national park,Central Australia','Karoo National Park,South Africa','Jau National Park,Amazon Rainforest')

figure;
RH1=smooth(W1,3,'rloess');
RH2=smooth(W2,3,'rloess');
RH3=smooth(W3,3,'rloess');
plot(x,W1,x,W2,x,W3);
xlabel('Time(month)') % 在当前图形的x轴做标注
ylabel('Surface solar radiation(MJ/km^2)') % 在当前图形的y轴做标注
figure;
RH1=smooth(R1,3,'rloess');
RH2=smooth(R2,3,'rloess');
RH3=smooth(R3,3,'rloess');
plot(x,R1,x,R2,x,R3);
xlabel('Time(month)') % 在当前图形的x轴做标注
ylabel('Ryear(mm)') % 在当前图形的y轴做标注
