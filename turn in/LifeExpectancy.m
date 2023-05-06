close all
clear
x = [1980, 1985, 1990, 1995, 2000, 2005, 2010];
v = [73.7, 74.7, 75.4, 75.8, 77.0, 77.8, 78.7];
xq = linspace(1980, 2010, 31);
vq1 = interp1(x,v,xq);
y = ones(31,2);
y(1,:) = [1980,vq1(1)];
for i = 2:31
    y(i,1) = y(i-1,1) + 1;
    y(i,2) = vq1(i);
end
format short g
disp(y)
plot(x,v,'bo',xq,vq1,'rx');
xlim([1980 2010]);
xlabel('Year','FontSize',12)
ylabel('Life expectancy','FontSize',12)
title('Life expectancy over time','FontSize',14)