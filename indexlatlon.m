function [indexes] = indexlatlon(lat,lon,deltalat,deltalon)
%% indexlatlon.m Finds data inside geographical areas
%--------------------------------------------------------------------------
% Input
%------
% lat       - Vector of latitudes, in order, of measurements
% lon       - Vector of longitudes, in order, of measurements
% deltalat  - [minlat maxlat] latitude interval where to look for data 
% deltalon  - [minlon maxlon] longitude interval where to look for data
%--------------------------------------------------------------------------
% Output
%------
% indexes            - Indexes of the latitude (longitude) data that is
%                       inside the area defined by deltalat and deltalon
%--------------------------------------------------------------------------
% Modified: 05th Jun 2018 
% Created : 05th Jun 2018
% Author  : Joaquin Diaz Pena
% Ref     : 
%--------------------------------------------------------------------------

indexes=0;
j=1;

%deltalon=[-188 -130];
%deltalat=[50 73];

for i=1:length(lat)
    if deltalat(1)<=lat(i) && lat(i)<=deltalat(2) && deltalon(1)<=lon(i) && lon(i)<=deltalon(2)
        indexes(j)=i;
        j=j+1;
    end
end