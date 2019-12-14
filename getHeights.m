function [ FHeights ] = getHeights(pfisrGD)
%% getHeights.m Geodata manager to find heights for PFISR data
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% Modified: 05th Jun 2018 
% Created : 05th Jun 2018
% Author  : Joaquin Diaz Pena
% Ref     : 
%--------------------------------------------------------------------------


[alt coord]=size(pfisrGD.dataloc);

BDbase(1,:)=pfisrGD.dataloc(1,2:3);
n=1;
    
for i=2:alt
    if sum(BDbase(:, 1) == pfisrGD.dataloc(i,2) & BDbase(:, 2) == pfisrGD.dataloc(i,3))==0
        n=n+1;
        BDbase(n,:)=pfisrGD.dataloc(i,2:3);
    end
end

height=zeros(1,n);
heightn=ones(1,n);

for j=1:n
    for i=1:alt
        if sum(BDbase(j, 1) == pfisrGD.dataloc(i,2) & BDbase(j, 2) == pfisrGD.dataloc(i,3))==1
            height(heightn(j),j)=pfisrGD.dataloc(i,1);
            heightn(j)=heightn(j)+1;
        end
    end    
end

FHeights=height;
return

