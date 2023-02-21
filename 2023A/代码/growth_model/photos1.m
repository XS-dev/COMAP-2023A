function xdot=photos1(I)
a=15; b=0.01;c=5;
xdot=a.*I.*(1-b.*I)./(1+c.*I);
end

