function [lat0, lon0,altd]=geo2btrace(time,latitude,longitude,altitude,altdesire) 
%% geo2btrace.m Magnetic projection of satellite to 0 altitude 
%--------------------------------------------------------------------------
% Input
%------
% time      - Time to get the magnetic field line coordinates in MATLAB serial
%             date number format or a string that can be converted into MATLAB serial
%             date number format using DATENUM with no format specified (see
%             documentation of DATENUM for more information).
% latitude  - Vector of latitudes of measurements in degrees
% longitude - Vector of longitudes of measurements in degrees
% altitude  - Vector of altitude of measurements in km
% altdesire - Desire altitude of projection in km (eg, 0)
%--------------------------------------------------------------------------
% Output
%------
% lat0       - Latitude of projection in degrees
% lon0       - Longitude of projection in degrees
% alt0       - Actual altitude of projection in km
%--------------------------------------------------------------------------
% Modified: 05th Jun 2018 
% Created : 05th Jun 2018
% Author  : Joaquin Diaz Pena
% Ref     : 
%--------------------------------------------------------------------------

[lat, lon, alt] =igrfline(time,latitude,longitude,altitude,'geodetic',2.5*altitude,5e4);
alt=alt(alt>=altdesire);
sizeAlt=size(alt);
zeroindex=sizeAlt(1);


lat0=lat(zeroindex);
lon0=lon(zeroindex);
altd=alt(end);

return





