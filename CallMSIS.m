function msisData=CallMSIS(time,glat,glon,F107A,F107,APH,alt_km)

    for j = 1:length(alt_km)
        atmos(j) = msise00(datenum(time), glat, glon, F107A, F107, APH, alt_km(j));    
    end
    
    nO=[atmos.nO];
    nN2=[atmos.nN2];
    nO2=[atmos.nO2];
    nH=[atmos.nH];
    nHe=[atmos.nHe];
    AltTemp=[atmos.Tn];
    totalNumberDensity = nO+nN2+nO2+nH+nHe+[atmos.nAr]+[atmos.nO]+[atmos.nOanomalous];

    msisData.O=nO;
    msisData.N2=nN2;
    msisData.O2=nO2;
    msisData.H=nH;
    msisData.He=nHe;
    msisData.AltTemp=AltTemp';
    msisData.totalNumberDensity=totalNumberDensity;