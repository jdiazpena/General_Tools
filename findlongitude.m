function cindex=findlongitude(longitude)
%% findlongitude.m DMSP data managment. Eliminates error at 0 longitude from MADRIGAL data
%--------------------------------------------------------------------------
% Input
%------
% longitude     - Longitude data
%--------------------------------------------------------------------------
% Output
%------
% cindex        - Index of data without any problems at 0 longitude
%--------------------------------------------------------------------------
% Modified: 05th Jun 2018 
% Created : 05th Jun 2018
% Author  : Joaquin Diaz Pena
% Ref     : 
%--------------------------------------------------------------------------

%Eliminates points that break DMSP data from Madrigral

windex=find(diff(longitude)<-50);
dlon=diff(longitude);
wb=zeros(1,length(windex)+1);
we=zeros(1,length(windex)+1);
wb(1)=1;
we(end)=length(dlon);

for i=1:length(windex)
    j=windex(i);
    w=j-1;
    while dlon(w)>0
        w=w-1;
    end
    we(i)=w;
    w=j+1;
    while dlon(w)>0
        w=w+1;
    end
    wb(i+1)=w;
end

carray=wb(1):1:we(1);

for i=2:length(we)
    auxi=wb(i):1:we(i);
    carray=cat(2,carray,auxi);
end

cindex=carray;