function h = CirclePlot(x,y,r)
hold on
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = fill(xunit, yunit,'r');
axis square
axis([-2 2 -2 2])
