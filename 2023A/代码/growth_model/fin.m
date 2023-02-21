
S=7e4:1:700e4;
y1=-4.69e-5.*(S./7e4-100).^2+10;
y2=-3.13e-4.*(S./7e4-100).^2+10;
y3=-5.4e-4.*(S./7e4-100).^2+10;
y4=1.58e-4.*(S./7e4-100).^2+10;
plot(S,y1,S,y2,S,y3,S,y4);
legend('Surface solar radiation','Soil moisture content','Relative humidity','Temperature')
xlabel('Vegetation area(km^2)')

set(gca,'yticklabel',[])
set(gca,'XDir','reverse')%对X方向反转

