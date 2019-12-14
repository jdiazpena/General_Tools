function [FitsA]=ionAverage(Fits)

sizedata=size(Fits);
if sizedata(2)>2
    vls=(Fits(4,:,:,:,:));
    dvls=(FitsError(4,:,:,:,:));
    fraction=(Fits(1,:,:,:,:));
    vavgaux=vls.*fraction;
    vavgaux(isnan(vavgaux))=0;
    vavg=(sum(vavgaux,2));

    FitsA=zeros(sizedata(1),2,sizedata(3),sizedata(4),sizedata(5));
    
    FitsA(4,1,:,:,:)=vavg;
else
    FitsA=Fits;
end
