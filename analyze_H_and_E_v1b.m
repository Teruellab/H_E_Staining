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
%% 

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
    len=length(AreaSB);
    AreaSB(len+1:len+s1)=d;
end
figure,hist(AreaSB,0:50:10000)
title(['Cell Area for Sham for subcutaneous/inguinal fat, median: ' num2str(round(median(AreaSB)))])

VSB(1)=mean(VolumeSBmedian(1:14));
VSB(2)=mean(VolumeSBmedian(15:29));
VSB(3)=mean(VolumeSBmedian(30:44));
VSB(4)=mean(VolumeSBmedian(45:58));
VSB(5)=mean(VolumeSBmedian(59:73));
VSB(6)=mean(VolumeSBmedian(74:88));

for i=1:6
    NSB(i)=10^9*WeightSB(i)/VSB(i);
end


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
    len=length(AreaCB);
    AreaCB(len+1:len+s1)=d;
end
figure,hist(AreaCB,0:50:10000)
title(['Cell Areas for Cort for subcutaneous/inguinal fat, median: ' num2str(round(median(AreaCB)))])

VCB(1)=mean(VolumeCBmedian(1:15));
VCB(2)=mean(VolumeCBmedian(16:30));
VCB(3)=mean(VolumeCBmedian(31:45));
VCB(4)=mean(VolumeCBmedian(46:60));
VCB(5)=mean(VolumeCBmedian(61:75));
VCB(6)=mean(VolumeCBmedian(76:90));

for i=1:6
    NCB(i)=10^9*WeightCB(i)/VCB(i);
end

[mean(NCB) std(NCB)/sqrt(6)]
[mean(NSB) std(NSB)/sqrt(6)]
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
    len=length(AreaSE);
    AreaSE(len+1:len+s1)=d;
end
figure,hist(AreaSE,0:50:10000)
title(['Cell Areas for Sham for visceral/epidydimal/gonadal fat, median: ' num2str(round(median(AreaSE)))])

VSE(1)=median(VolumeSEmedian(1:15));
VSE(2)=median(VolumeSEmedian(16:30));
VSE(3)=median(VolumeSEmedian(31:45));
VSE(4)=median(VolumeSEmedian(46:60));
VSE(5)=median(VolumeSEmedian(61:75));
VSE(6)=median(VolumeSEmedian(76:90));

for i=1:6
    NSE(i)=10^9*WeightSE(i)/VSE(i);
end

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
    CellNumberCE(i)=10^9/1.28^3*WSB(i-2)/(4/3/sqrt(pi)*median(d)^1.5);

    len=length(AreaCE);
    AreaCE(len+1:len+s1)=d;
end
figure,hist(AreaCE,0:50:10000)
title(['Cell Areas for Cort for visceral/epidydimal/gonadal fat, median: ' num2str(round(median(AreaCE)))])
VCE(1)=median(VolumeCEmedian(1:15));
VCE(2)=median(VolumeCEmedian(16:30));
VCE(3)=median(VolumeCEmedian(31:45));
VCE(4)=median(VolumeCEmedian(46:60));
VCE(5)=median(VolumeCEmedian(61:75));
VCE(6)=median(VolumeCEmedian(76:90));

for i=1:6
    NCE(i)=10^9*WeightCE(i)/VCE(i);
end

[mean(NCE) std(NCE)/sqrt(6)]
[mean(NSE) std(NSE)/sqrt(6)]
