function RadarLOSmplot(datafile,StartTime,EndTime,factor,error)

%% RadaLOSmplot.m Plots LOS velocities from AMISR data given a certain error
%--------------------------------------------------------------------------
% Input
%------
% StartTime  - Initial Time to plot in string format, eg '09/08/2017 02:00:00';
% EndTime    - Final Time to plot in string format, eg '09/08/2017 02:00:00';  
% datafile   - struct of DMSP data as obtained from DMSPdatafetch.m (Madrigal
%               case)
% factor     - Factor by which the velocities are divided (originally m/s)
% error      - Minimun error for velocities to be plotted. 
%--------------------------------------------------------------------------
% Output
%------
% Plot over an already existant map the LOS valocities from the radar. 
%--------------------------------------------------------------------------
% Modified: 05th Jun 2018 
% Created : 05th Jun 2018
% Author  : Joaquin Diaz Pena
% Ref     : 
%--------------------------------------------------------------------------




reftime1 = datenum(StartTime);
reftime2 = datenum(EndTime);
deltat=reftime2-reftime1;

[Vx,Vy,Vi,dVi,Xr,Yr,t,t2,utime,bco]=VlosAMISR(datenum(StartTime),datenum(StartTime)+deltat,datafile);

%%Geographic latitude and longitude of Resolute bay
lat0=h5read(datafile,'/Site/Latitude');
lon0=h5read(datafile,'/Site/Longitude');

l=size(utime);
mtime = zeros(l(1),l(2));

%Converting the time from unix time to matlab time
for i1 = 1:l(1)
    for i2 = 1:l(2)
        mtime(i1,i2) = datenum([1970 1 1 0 0 double(utime(i1,i2))]); 
    end
end

tidstr =  datestr(mtime(1,t));
    tidstrstop = datestr(mtime(1,t+1));
    radartime = str2num(tidstr(13:14))+str2num(tidstr(16:17))/60+str2num(tidstr(19:20))/3600;
    radartimestop = str2num(tidstrstop(13:14))+str2num(tidstrstop(16:17))/60+str2num(tidstrstop(19:20))/3600;
    radaryear = str2num(datestr(mtime(1,t),11));
    radarmonth = str2num(datestr(mtime(1,t),5));
    radarday = str2num(datestr(mtime(1,t),7));

%Getting the positions of the radar beams from the radar data
% Azimuth and elevation in degrees
az = bco(2,:);% * pi/180;
el = bco(3,:);% * pi/180;  

good2=find(abs(dVi./Vi)<error);

[lat1, lon1]=kmtolatlon(lat0,lon0,Yr,Xr);
[x0,y0] = mfwdtran(lat0,lon0);
plot(x0,y0,'kp','MarkerEdgeColor', 	[0.75, 0, 0.75],'MarkerFaceColor', 	[0.75, 0, 0.75],'MarkerSize',8);

r0=90-lat0;
phi0=lon0;
x0=r0*cosd(phi0);
y0=r0*sind(phi0);

lat1=lat1(good2);
lon1=lon1(good2);
Vi=Vi(good2);

for i=1:length(lat1)
    r1=90-lat1(i);
    phi1=lon1(i);
    x1=r1*cosd(phi1);
    y1=r1*sind(phi1);
    m=(y1-y0)/(x1-x0);
    v=[sign(x1-x0)*m,sign(x1-x0)];
    v=v.*Vi(i)/(norm(v)*factor);
    xf=v(2)+x1;
    yf=v(1)+y1;
    [latf, lonf]=cart2latlon(xf,yf);
    if Vi(i)>=0
        linem([lat1(i) latf],[lon1(i) lonf],'Color',[0.9290, 0.6940, 0.1250])
    else
        linem([lat1(i) latf],[lon1(i) lonf],'k')
    end
end

scatterm(lat1,lon1,5,Vi,'filled')
colormap(jet)
hc=colorbar;
title(hc,'V (m/s)');

strdate=datestr(reftime1);
strdate=strdate(13:17);

textm(lat0, lon0-10, strdate , 'FontSize',8,'Color', 'r')


