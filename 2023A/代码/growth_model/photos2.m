function xdot=photos2(I)
a=5; b=0.01;c=3;
xdot=a.*I.*(1-b.*I)./(1+c.*I);
end

