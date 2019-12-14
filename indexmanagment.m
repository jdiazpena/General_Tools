function finalindexes=indexmanagment(indexes)
%% indexmanagment: manages the indexes where DMSP passes start and finish
%--------------------------------------------------------------------------
% Input
%------
% indexes -  indexes of the data to be plotted
%--------------------------------------------------------------------------
% Output
%------
% finalindexes  - Separets the indexes in a new vector by passes
%--------------------------------------------------------------------------
% Modified: 28th Jun 2018 
% Created : 05th Jun 2018
% Author  : Joaquin Diaz Pena
% Ref     : 
%--------------------------------------------------------------------------

deltaindexes=diff(indexes);
breakpoints=find(deltaindexes>1);

if isempty(breakpoints)
    bindexes=1;
    eindexes=length(indexes);
    finalindexes=[bindexes,eindexes]';
    return
end

bindexes=zeros(length(breakpoints)+1,1);
eindexes=zeros(length(breakpoints)+1,1);

bindexes(1)=1;
eindexes(end)=length(indexes);
eindexes(1:end-1)=breakpoints;
bindexes(2:end)=breakpoints+1;

finalindexes=[bindexes,eindexes]';

    
