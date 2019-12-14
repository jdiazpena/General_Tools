function iriData=CallIRI(time,glat,glon,altkmrange)


iono1=iri2016(datenum(time), glat, glon,altkmrange);
iono1=fixiono(iono1);
    
    iriData.nOI=iono1.nO';
    iriData.nNOI=iono1.nNO';
    iriData.nO2I=iono1.nO2';
    iriData.nNI=iono1.nN';
    iriData.nHI=(iono1.nH)';
    iriData.nHeI=(iono1.nHe)';
    iriData.Te=iono1.Te';
    iriData.Ti=iono1.Ti';
    iriData.Ne=iono1.Ne';
    iriData.totalIonDensity=(iono1.nO+iono1.nNO+iono1.nO2+iono1.nN+(iono1.nH)+(iono1.nHe))';