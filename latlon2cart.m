function [x0, y0]=latlon2cart(lat0,lon0)
%% latlon2cart.m Polar transformation assuming north emisphere
%--------------------------------------------------------------------------
% Input
%------
% lat0   - latitude (works only for north emisphere)
% lon0   - longitude
%--------------------------------------------------------------------------
% Output
%------
% x0   - x coordinate
% y0   - y coordinate
%--------------------------------------------------------------------------
% Modified: 13th Jun 2018  
% Created : 13th Jun 2018
% Author  : Joaquin Diaz Pena
% Ref     : 
%--------------------------------------------------------------------------
r0=90-lat0;
phi0=lon0;
x0=r0.*cosd(phi0);
y0=r0.*sind(phi0);