
Rt1=1:1:45;
b=1:1:45;
for i=1:1:45
    b(i)=i;
    N=i;
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
tf=4;
dt=1;
[t, N1, N2] = population_competition(r1, r2, K1, K2, s1, s2, N10, N20, t0, tf, dt);
N3=N1+N2;
figure
plot(t, N1, t, N2, t, N3,'LineWidth', 3), grid on, xlabel('t'), ylabel('N'), legend('N1', 'N2','N');
Rt1(i)=-8000*400/(N3(4)-8000);
end
Rt1(1)=3538/8000;
Rt1(2)=3538/8000;
Rt1(3)=3538/8000;
Rt1(4)=3538/8000;
Rt1(5)=3538/8000;
Rt1(6)=3538/8000;
Rt1(7)=3538/8000;
figure 
plot(b,Rt1,'b.-')
xlabel('N')
ylabel('Rt/mm')
fill([b,fliplr(b)],[Rt1,0*ones(1,length(Rt1))],'b');
%set(h,'edgealpha',0,'facealpha',0.1)
Rt2=1:1:45;
for i=1:1:45
    b(i)=i;
    N=i;
k=0.17;
r1=0.105;
r2=0.105;
K1=round(k*N)*8000/N;
K2=3538*round((1-k)*N)/N;
s1=-(N-1)*0.04*(1./(exp(-(600-200)./40)+1)-3/4);
s2=-(N-1)*0.04*(1./(exp(-(600-200)./40)+1)-3/4);
N10=round(k*N)*8000/N;
N20=round((1-k)*N)*8000/N;
t0=0;
tf=4;
dt=1;
[t, N1, N2] = population_competition(r1, r2, K1, K2, s1, s2, N10, N20, t0, tf, dt);
N3=N1+N2;
%figure
%plot(t, N1, t, N2, t, N3,'LineWidth', 3), grid on, xlabel('t'), ylabel('N'), legend('N1', 'N2','N');
Rt2(i)=-8000*400/(N3(4)-8000);
end
Rt2(1)=3538/8000;
Rt2(2)=3538/8000;
Rt3=1:1:45;
for i=1:1:45
    b(i)=i;
    N=i;
k=0.27;
r1=0.105;
r2=0.105;
K1=round(k*N)*8000/N;
K2=3538*round((1-k)*N)/N;
s1=-(N-1)*0.04*(1./(exp(-(600-200)./40)+1)-3/4);
s2=-(N-1)*0.04*(1./(exp(-(600-200)./40)+1)-3/4);
N10=round(k*N)*8000/N;
N20=round((1-k)*N)*8000/N;
t0=0;
tf=4;
dt=1;
[t, N1, N2] = population_competition(r1, r2, K1, K2, s1, s2, N10, N20, t0, tf, dt);
N3=N1+N2;
%figure
%plot(t, N1, t, N2, t, N3,'LineWidth', 3), grid on, xlabel('t'), ylabel('N'), legend('N1', 'N2','N');
Rt3(i)=-8000*400/(N3(4)-8000);
end
Rt3(1)=3538/8000;
figure 
plot((b-1)/log(8000),Rt1)
hold on
plot((b-1)/log(8000),Rt2)
hold on
plot((b-1)/log(8000),Rt3)
xlabel(' Species Richness ')
ylabel('Rt/mm')
legend('Tree','Bush','Grass')

a=10;
R=[480,384,	252,144,84,72,48,108,156,252,276,408,222,480];
W1=1:1:13;
W1(1)=6400;
for j=1:1:12
    W1(j+1)=W1(j)*(1+(R(j+1)-R(j))/Rt1(a));
end
W2=1:1:13;
W2(1)=6400;
for j=1:1:12
    W2(j+1)=W2(j)*(1+(R(j+1)-R(j))/Rt2(a));
end
W3=1:1:13;
W3(1)=6400;
for j=1:1:12
    W3(j+1)=W3(j)*(1+(R(j+1)-R(j))/Rt3(a));
end

j=1:1:13;
figure
plot(j,W1)
hold on
plot(j,W2)
hold on
plot(j,W3)
xlabel('Time/month')
ylabel('Qmax/Mj')
legend('Tree','Bush','Grass')
