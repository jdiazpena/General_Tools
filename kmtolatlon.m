function [flat, flon]=kmtolatlon(lat0,lon0,dnorth,deast)

latfactor=1/111.321543;
flat=latfactor.*dnorth+lat0;

lonfactor=latfactor./cosd(flat);
flon=lonfactor.*deast+lon0;
