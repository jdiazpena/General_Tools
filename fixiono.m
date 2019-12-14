function ionof=fixiono(iono)

indexes=iono.Ti<0 | iono.Ne<0;
iono.altkm(indexes)=NaN;
iono.Ne(indexes)=NaN;
iono.Tn(indexes)=NaN;
iono.Ti(indexes)=NaN;
iono.Te(indexes)=NaN;
iono.nO(indexes)=NaN;
iono.nH(indexes)=NaN;
iono.nHe(indexes)=NaN;
iono.nO2(indexes)=NaN;
iono.nNO(indexes)=NaN;
iono.nCl(indexes)=NaN;
iono.nN(indexes)=NaN;

ionof=iono;