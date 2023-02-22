Qmax1=7500000;
Qmax2=10000;
Qmax3=17000;
SR1=1:1:45;
SR2=1:1:45;
SR3=1:1:45;
N=1:1:45;
for i=1:1:45
    N(i)=1.5*i;
SR1(i)=(N(i)-1)./log(Qmax1);
SR2(i)=(N(i)-1)./log(Qmax2);
SR3(i)=(N(i)-1)./log(Qmax3);
end
figure
plot(N,SR1)
hold on
plot(N,SR2)
hold on
plot(N,SR3)
xlabel('The number of  species')
ylabel('species rishness')
legend('Amazon in Brazil','Central Australia','Southern South Africa')