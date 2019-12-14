function datefinal=managedate(date,sec,sat)

dateuse=(date);

if sat==15
    yearstr=num2str(round(dateuse/1000)+1900);
else
    yearstr=num2str(round(dateuse/1000));
end

day=dateuse-round(dateuse/1000)*1000;

mattime=datenum([yearstr(1,:),'/','01','/','01'])+day-1;
matstr=datestr(mattime);

hours=floor(sec./3600);
minutesaux=(rem(sec,3600)/60);
minutes=floor(rem(sec,3600)/60);
seconds=(minutesaux-minutes)*60;

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

chrseconds=char(strseconds);
chrminutes=char(strminutes);
chrhours=char(strhours);

char_array1 = char(ones(length(sec),1) * ':');
timef=[chrhours,char_array1,chrminutes,char_array1,chrseconds];


char_array = char(ones(length(sec),1) * '  ');
datefinal=[matstr,char_array,timef];


