Rt1=1:1:9;
fd=[0.01,0.1,0.2,0.4,0.8,1,4/3,2,4];
for i=1:1:9
    N=10;
k=0.07;
r1=0.105;
r2=0.105;
K1=round(k*N)*8000/N;
K2=3538*round((1-k)*N)/N;
s1=-(N-1)*0.04*(1./(exp(-(600-200)./40)+1)-3/4);
s2=-(N-1)*0.04*(1./(exp(-(600-200)./40)+1)-3/4);
N10=round(k*N)*8000/N;
N20=round((1-k)*N)*8000/N;
t0=0;
tf=4/fd(i);
dt=1;
[t, N1, N2] = population_competition(r1, r2, K1, K2, s1, s2, N10, N20, t0, tf, dt);
N3=N1+N2;
%figure
%plot(t, N1, t, N2, t, N3,'LineWidth', 3), grid on, xlabel('t'), ylabel('N'), legend('N1', 'N2','N');
Rt1(i)=-8000*400/((N3(tf)-8000));
end
Rt2=1:1:9;

for i=1:1:9
    N=25;
k=0.07;
r1=0.105;
r2=0.105;
K1=round(k*N)*8000/N;
K2=3538*round((1-k)*N)/N;
s1=-(N-1)*0.04*(1./(exp(-(600-200)./40)+1)-3/4);
s2=-(N-1)*0.04*(1./(exp(-(600-200)./40)+1)-3/4);
N10=round(k*N)*8000/N;
N20=round((1-k)*N)*8000/N;
t0=0;
tf=4/fd(i);
dt=1;
[t, N1, N2] = population_competition(r1, r2, K1, K2, s1, s2, N10, N20, t0, tf, dt);
N3=N1+N2;
%figure
%plot(t, N1, t, N2, t, N3,'LineWidth', 3), grid on, xlabel('t'), ylabel('N'), legend('N1', 'N2','N');
Rt2(i)=-8000*400/((N3(tf)-8000));
end
Rt3=1:1:9;

for i=1:1:9
    N=40;
k=0.07;
r1=0.105;
r2=0.105;
K1=round(k*N)*8000/N;
K2=3538*round((1-k)*N)/N;
s1=-(N-1)*0.04*(1./(exp(-(600-200)./40)+1)-3/4);
s2=-(N-1)*0.04*(1./(exp(-(600-200)./40)+1)-3/4);
N10=round(k*N)*8000/N;
N20=round((1-k)*N)*8000/N;
t0=0;
tf=4/fd(i);
dt=1;
[t, N1, N2] = population_competition(r1, r2, K1, K2, s1, s2, N10, N20, t0, tf, dt);
N3=N1+N2;
%figure
%plot(t, N1, t, N2, t, N3,'LineWidth', 3), grid on, xlabel('t'), ylabel('N'), legend('N1', 'N2','N');
Rt3(i)=-8000*400/((N3(tf)-8000));
end
Rt4=1:1:9;

for i=1:1:9
    N=45;
k=0.07;
r1=0.105;
r2=0.105;
K1=round(k*N)*8000/N;
K2=3538*round((1-k)*N)/N;
s1=-(N-1)*0.04*(1./(exp(-(600-200)./40)+1)-3/4);
s2=-(N-1)*0.04*(1./(exp(-(600-200)./40)+1)-3/4);
N10=round(k*N)*8000/N;
N20=round((1-k)*N)*8000/N;
t0=0;
tf=4/fd(i);
dt=1;
[t, N1, N2] = population_competition(r1, r2, K1, K2, s1, s2, N10, N20, t0, tf, dt);
N3=N1+N2;
%figure
%plot(t, N1, t, N2, t, N3,'LineWidth', 3), grid on, xlabel('t'), ylabel('N'), legend('N1', 'N2','N');
Rt4(i)=-8000*400/((N3(tf)-8000));
end
figure 
plot(fd,Rt1)
hold on
plot(fd,Rt2)
hold on
plot(fd,Rt3)
hold on
plot(fd,Rt4)

xlabel('Frequency of droughts/month^-^1')
ylabel('Rt/mm')
legend('N=15','N=25','N=40','N=45')

