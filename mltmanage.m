function mltfinal=mltmanage(mlt)
%% mltmanage.m Change MLT time from double in HH.Hfraction to string HH:MM
%--------------------------------------------------------------------------
% Input
%------
% mlt - Array of MLT times in double format eg 20.3
%--------------------------------------------------------------------------
% Output
%------
% mltfinal - Array of string of MLT times in HH:MM format
%--------------------------------------------------------------------------
% Modified: 05th Jun 2018 
% Created : 05th Jun 2018
% Author  : Joaquin Diaz Pena
% Ref     : 
%--------------------------------------------------------------------------

hours=floor(mlt);
minutesd=60*(mlt-hours);
minutes=floor(minutesd);
seconds=floor(60*(minutesd-minutes));



shours=num2str(hours);
strhours=strings(length(shours),1);
if length(shours(1,:))==1
    for i=1:length(strhours)
        strhours(i,1)=strcat('0',shours(i));
    end
else
    for i=1:length(strhours)
    strhours(i,:)=strrep(shours(i,:),' ','0');
    end
end
    

sminutes=num2str(minutes);
strminutes=strings(length(sminutes),1);
if length(sminutes(1,:))==1
    for i=1:length(strminutes)
        strminutes(i,1)=strcat('0',sminutes(i));
    end
else
    for i=1:length(strminutes)
    strminutes(i,:)=strrep(sminutes(i,:),' ','0');
    end
end

sseconds=num2str(seconds);
strseconds=strings(length(sseconds),1);
if length(sseconds(1,:))==1
    for i=1:length(strseconds)
        strseconds(i,1)=strcat('0',sseconds(i));
    end
else
    for i=1:length(strseconds)
    strseconds(i,:)=strrep(sseconds(i,:),' ','0');
    end
end

mltfinal=strcat(strhours,':',strminutes);