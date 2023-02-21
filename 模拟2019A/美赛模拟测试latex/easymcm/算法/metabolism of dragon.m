clear,clc
t=0:200;
m=75000*exp(exp(-0.15*t)*log(1/7500));
T=25;
W1=0.15*log(7500)*m.*exp(-0.15*t)*29301/365;
W2=29.7*m;
W3=2929.4*m.^0.75*(0.03*T+0.1);
W4=m.^0.75*1050;
W=W1+W2+W3+W4;
figure(1)
plot(t,[W1;W2;W3;W4],'*')
legend('W1 Energy consumption for growth','W2 Energy consumption for spitting fire','W3 Energy consumption for resting metabolism','W4 Energy consumption for flight')
xlabel('Age of dragon  t/year')
title('{\bf different kinds of energy consumption of dragon}')
ylabel('energy consumption Wx/kJ')
grid on
figure(2)
plot(t,m,'-b')
title('{\bf Gompertz model Growth curve of dragon}')
xlabel('Age of dragon  t/year')
ylabel('Weight of dragon   W/kg')
text(40,73359,'\leftarrow t=40y W=73359.4kg maturity')
grid on
figure(3)
plot(t,W,'-r*')
xlabel('Age of dragon  t/year')
ylabel('energy consumption Wdaily/kJ')
title('{\bf energy consumption of dragon}')
text(40,17577800,'\leftarrow t=40y Wdaily=17977800kJ maturity')
grid on


