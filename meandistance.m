%calculate mean distance
function distance=meandistance(r)


distance=zeros(size(r,1)-1,size(r,2));

for i=1:size(r,2)
    for j=1:size(r,1)-1
        distance(j,i)=r(j+1,i)-r(j,i);
    end
end
meandistance=mean(mean(distance(:,:)));

distance=meandistance;


% rp=reshape(r,[size(r,1)*size(r,2) 1]);
% rp=sort(rp);
% 
% rd=zeros(length(rp)-1,1);
% 
% for i=1:length(rd)
%     rd(i)=rp(i+1)-rp(i);
% end
% 
% distance=nanmean(rd);

