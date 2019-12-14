lat0=75
lon0=-150
lat1=lat0+1e-10;
lon1=lon0;
[x0,y0]=latlon2cart(lat0,lon0);
[x1,y1]=latlon2cart(lat1,lon1);
xd=x1-x0;
yd=y1-y0;
v=[xd;yd];
vn=10*v/norm(v);
rmatrix=[0, -1; 1, 0];
ve=rmatrix*v;
ve=10*ve/norm(ve);
xf=vn(1)+x0;
yf=vn(2)+y0;
[latf1,lonf1]=cart2latlon(xf,yf);
a=linem([lat0 latf1],[lon0 lonf1],'r');
xf=ve(1)+x0;
yf=ve(2)+y0;
[latf,lonf]=cart2latlon(xf,yf);
b=linem([lat0 latf],[lon0 lonf],'r');
vn=10*v/norm(v);
rmatrix=[0, 1; -1, 0];
ve=rmatrix*v;
ve=10*ve/norm(ve);
xf=vn(1)+x0;
yf=vn(2)+y0;
[latf1,lonf1]=cart2latlon(xf,yf);
a=linem([lat0 latf1],[lon0 lonf1],'r');
xf=ve(1)+x0;
yf=ve(2)+y0;
[latf,lonf]=cart2latlon(xf,yf);
b=linem([lat0 latf],[lon0 lonf],'r');



lat1=latf1-lat0;
lon1=lonf1-lon0;
lat2=latf-lat0;
lon2=lonf-lon0;


[x1]=a.XData;
[x2]=b.XData;
[y1]=a.YData;
[y2]=b.YData;
xx1=x1(2);
xx2=x2(2);
xx0=x1(1);
yy1=y1(2);
yy2=y2(2);
yy0=y1(1);
x1=xx1-xx0;
x2=xx2-xx0;
y1=yy1-yy0;
y2=yy2-yy0;
angle = atan2d(x1*y2-y1*x2,x1*x2+y1*y2)