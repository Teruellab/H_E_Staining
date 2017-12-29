%% 
clear all
close all

% E=visceral, gonadal, epidydma
% B=subq, inguinal, leg fat
WeightSE(1:6)=[459.5 385 474.6 401.8 594.5 597.5];
WeightCE(1:6)=[1357.2 840.4 1210.8 1366.6 1000.3 646];
WeightSB(1:6)=[226.4 208.9 202 212.5 328.9 330.7];
WeightCB(1:6)=[621.2 397.1 670.5 686.9 375.7 340.4];

WSB(1:14)=WeightSB(1);  %Lookup table to show which mouse the images(slicesxsites) belong to
WSB(15:29)=WeightSB(2);
WSB(30:44)=WeightSB(3);
WSB(45:58)=WeightSB(4);
WSB(59:73)=WeightSB(5);
WSB(74:88)=WeightSB(6);

WCB(1:15)=WeightCB(1);  %Lookup table to show which mouse the images(slicesxsites) belong to
WCB(16:30)=WeightCB(2);
WCB(31:45)=WeightCB(3);
WCB(46:60)=WeightCB(4);
WCB(61:75)=WeightCB(5);
WCB(76:90)=WeightCB(6);

WSE(1:15)=WeightSE(1);  %Lookup table to show which mouse the images(slicesxsites) belong to
WSE(16:30)=WeightSE(2);
WSE(31:45)=WeightSE(3);
WSE(46:60)=WeightSE(4);
WSE(61:75)=WeightSE(5);
WSE(76:90)=WeightSE(6);

WCE(1:15)=WeightCE(1);  %Lookup table to show which mouse the images(slicesxsites) belong to
WCE(16:30)=WeightCE(2);
WCE(31:45)=WeightCE(3);
WCE(46:60)=WeightCE(4);
WCE(61:75)=WeightCE(5);
WCE(76:90)=WeightCE(6);


imagedir = '/Volumes/labdata/mary/';
experimentdir = [imagedir,'171220_FatHistology/'];
datadir = [experimentdir,'Data/'];
imagedir1 = [datadir,'ShamB/'];
Files=dir(imagedir1);
AreaSB=[];
for i=3:length(Files)
    load([imagedir1 Files(i).name]);
    s1=size(finaldata);
    clear d
    for num1=1:s1
        d(num1)=finaldata(num1).Area;
    end
    VolumeSBmedian(i)=1.28^3 * 4/3*sqrt(pi)*mean(d)^1.5;
    CellNumberSB(i)=10^9/1.28^3*WSB(i-2)/(4/3*sqrt(pi)*mean(d)^1.5);
    len=length(AreaSB);
    AreaSB(len+1:len+s1)=d;
end
figure,hist(AreaSB,0:50:10000)
title(['Cell Area for Sham for subcutaneous/inguinal fat, median: ' num2str(round(median(AreaSB)))])

imagedir = '/Volumes/labdata/mary/';
experimentdir = [imagedir,'171220_FatHistology/'];
datadir = [experimentdir,'Data/'];
imagedir1 = [datadir,'CortB/'];
Files=dir(imagedir1);
AreaCB=[];
for i=3:length(Files)
    load([imagedir1 Files(i).name]);
    s1=size(finaldata);
    clear d
    for num1=1:s1
        d(num1)=finaldata(num1).Area;
    end
    VolumeCBmedian(i)=1.28^3 * 4/3*sqrt(pi)*mean(d)^1.5;
    CellNumberCB(i)=10^9/1.28^3*WCB(i-2)/(4/3*sqrt(pi)*mean(d)^1.5);
    len=length(AreaCB);
    AreaCB(len+1:len+s1)=d;
end
figure,hist(AreaCB,0:50:10000)
title(['Cell Areas for Cort for subcutaneous/inguinal fat, median: ' num2str(round(median(AreaCB)))])

VSB(1)=mean(VolumeSBmedian(1:14));
VSB(2)=mean(VolumeSBmedian(15:29));
VSB(3)=mean(VolumeSBmedian(30:44));
VSB(4)=mean(VolumeSBmedian(45:58));
VSB(5)=mean(VolumeSBmedian(59:73));
VSB(6)=mean(VolumeSBmedian(74:88));

NSB(1)=mean(CellNumberSB(1:14));
NSB(2)=mean(CellNumberSB(15:29));
NSB(3)=mean(CellNumberSB(30:44));
NSB(4)=mean(CellNumberSB(45:58));
NSB(5)=mean(CellNumberSB(59:73));
NSB(6)=mean(CellNumberSB(74:88));

for i=1:6
    VCB(i)=mean(VolumeCBmedian((i-1)*15+1:i*15));
end
for i=1:6
    NCB(i)=mean(CellNumberCB((i-1)*15+1:i*15));
end

['Cort, subcutaneous #cells:' num2str(round(mean(CellNumberCB))) '+-' num2str(round(std(CellNumberCB)/sqrt(length(CellNumberCB))))]

['Sham, subcutaneous #cells:' num2str(round(mean(CellNumberSB))) '+-' num2str(round(std(CellNumberSB)/sqrt(length(CellNumberSB))))]


['Cort, subcutaneous, Volume:' num2str(round(mean(VolumeCBmedian))) '+-' num2str(round(std(VolumeCBmedian)/sqrt(length(VolumeCBmedian))))]

['Sham, subcutaneous, Volume:' num2str(round(mean(VolumeSBmedian))) '+-'  num2str(round(std(VolumeSBmedian)/sqrt(length(VolumeSBmedian))))]


['Cort, subcutaneous #cells:' num2str(round(mean(NCB))) '+-' num2str(round(std(NCB)/sqrt(length(NCB))))]

['Sham, subcutaneous #cells:' num2str(round(mean(NSB))) '+-' num2str(round(std(NSB)/sqrt(length(NSB))))]



['Cort, subcutaneous, Volume:' num2str(round(mean(VCB))) '+-' num2str(round(std(VCB)/sqrt(length(VCB))))]

['Sham, subcutaneous, Volume:' num2str(round(mean(VSB))) '+-'  num2str(round(std(VSB)/sqrt(length(VSB))))]

%% 
imagedir = '/Volumes/labdata/mary/';
experimentdir = [imagedir,'171220_FatHistology/'];
datadir = [experimentdir,'Data/'];
imagedir1 = [datadir,'ShamE/'];
Files=dir(imagedir1);
AreaSE=[];
for i=3:length(Files)
    load([imagedir1 Files(i).name]);
    s1=size(finaldata);
    clear d
    for num1=1:s1
        d(num1)=finaldata(num1).Area;
    end
    VolumeSEmedian(i)=1.28^3 * 4/3*sqrt(pi)*median(d)^1.5;
    CellNumberSE(i)=10^9/1.28^3*WSE(i-2)/(4/3*sqrt(pi)*median(d)^1.5);
    len=length(AreaSE);
    AreaSE(len+1:len+s1)=d;
end
figure,hist(AreaSE,0:50:10000)
title(['Cell Areas for Sham for visceral/epidydimal/gonadal fat, median: ' num2str(round(median(AreaSE)))])



imagedir = '/Volumes/labdata/mary/';
experimentdir = [imagedir,'171220_FatHistology/'];
datadir = [experimentdir,'Data/'];
imagedir1 = [datadir,'CortE/'];
Files=dir(imagedir1);

AreaCE=[];
for i=3:length(Files)
    load([imagedir1 Files(i).name]);
    s1=size(finaldata);
    clear d
    for num1=1:s1
        d(num1)=finaldata(num1).Area;
    end
    VolumeCEmedian(i)=1.28^3 * 4/3*sqrt(pi)*median(d)^1.5;
    CellNumberCE(i)=10^9/1.28^3*WCE(i-2)/(4/3*sqrt(pi)*median(d)^1.5);
    len=length(AreaCE);
    AreaCE(len+1:len+s1)=d;
end
figure,hist(AreaCE,0:50:10000)
title(['Cell Areas for Cort for visceral/epidydimal/gonadal fat, median: ' num2str(round(median(AreaCE)))])

['Cort, visceral, #cells:' num2str(round(mean(CellNumberCE))) '+-'  num2str(round(std(CellNumberCE)/sqrt(length(CellNumberCE))))]

['Sham visceral, #cells:' num2str(round(mean(CellNumberSE))) '+-'  num2str(round(std(CellNumberSE)/sqrt(length(CellNumberSE))))]


['Cort, visceral, Volume:' num2str(round(mean(VolumeCEmedian))) '+-' num2str(round(std(VolumeCEmedian)/sqrt(length(VolumeCEmedian))))]

['Sham, visceral, Volume:' num2str(round(mean(VolumeSEmedian))) '+-' num2str(round(std(VolumeSEmedian)/sqrt(length(VolumeSEmedian))))]
