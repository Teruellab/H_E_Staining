%% 
clear all
close all

load 'weights' WeightsTable

% figure,plot(WeightsTable(1:6,2),WeightsTable(1:6,1),'ro')
% hold on,plot(WeightsTable(7:12,2),WeightsTable(7:12,1),'bo')
% figure,plot(WeightsTable(1:6,3),WeightsTable(1:6,1),'ro')
% hold on,plot(WeightsTable(7:12,3),WeightsTable(7:12,1),'bo')
figure,plot(WeightsTable(1:6,3),WeightsTable(1:6,2),'ro')
hold on,plot(WeightsTable(7:12,3),WeightsTable(7:12,2),'bo')
title('Correlation between visceral and subq fat, red Cort, blue sham')

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
AreaSB1=[];AreaSB2=[];AreaSB3=[];AreaSB4=[];AreaSB5=[];AreaSB6=[];
for i=3:length(Files)
    load([imagedir1 Files(i).name]);
    s1=size(finaldata);
    clear d
    for num1=1:s1
        d(num1)=finaldata(num1).Area;
    end
    if i<15
        len=length(AreaSB1);
        AreaSB1(len+1:len+s1)=d;
    elseif i<30
        len=length(AreaSB2);
        AreaSB2(len+1:len+s1)=d;
    elseif i<45
        len=length(AreaSB3);
        AreaSB3(len+1:len+s1)=d;
    elseif i<59
        len=length(AreaSB4);
        AreaSB4(len+1:len+s1)=d;
    elseif i<74
        len=length(AreaSB5);
        AreaSB5(len+1:len+s1)=d;
    else
        len=length(AreaSB6);
        AreaSB6(len+1:len+s1)=d;
    end     
end

imagedir = '/Volumes/labdata/mary/';
experimentdir = [imagedir,'171220_FatHistology/'];
datadir = [experimentdir,'Data/'];
imagedir1 = [datadir,'CortB/'];
Files=dir(imagedir1);
AreaCB1=[];AreaCB2=[];AreaCB3=[];AreaCB4=[];AreaCB5=[];AreaCB6=[];
for i=3:length(Files)
    load([imagedir1 Files(i).name]);
    s1=size(finaldata);
    clear d
    for num1=1:s1
        d(num1)=finaldata(num1).Area;
    end
    if i<16
        len=length(AreaCB1);
        AreaCB1(len+1:len+s1)=d;
    elseif i<31
        len=length(AreaCB2);
        AreaCB2(len+1:len+s1)=d;
    elseif i<46
        len=length(AreaCB3);
        AreaCB3(len+1:len+s1)=d;
    elseif i<61
        len=length(AreaCB4);
        AreaCB4(len+1:len+s1)=d;
    elseif i<76
        len=length(AreaCB5);
        AreaCB5(len+1:len+s1)=d;
    else
        len=length(AreaCB6);
        AreaCB6(len+1:len+s1)=d;
    end     
end
%% 
[p x]=hist(log10(AreaCB1.^1.5));
figure,plot(x(1:end-1),p(1:end-1)/length(AreaCB1),'r-')
hold on
[p x]=hist(log10(AreaCB2.^1.5));
plot(x(1:end-1),p(1:end-1)/length(AreaCB2),'r-')
[p x]=hist(log10(AreaCB3.^1.5));
plot(x(1:end-1),p(1:end-1)/length(AreaCB3),'r-')
[p x]=hist(log10(AreaCB4.^1.5));
plot(x(1:end-1),p(1:end-1)/length(AreaCB4),'r-')
[p x]=hist(log10(AreaCB5.^1.5));
plot(x(1:end-1),p(1:end-1)/length(AreaCB5),'r-')
[p x]=hist(log10(AreaCB6.^1.5));
plot(x(1:end-1),p(1:end-1)/length(AreaCB6),'b-')

[p x]=hist(log10(AreaSB1.^1.5));
plot(x(1:end-1),p(1:end-1)/length(AreaSB1),'b-')
[p x]=hist(log10(AreaSB2.^1.5));
plot(x(1:end-1),p(1:end-1)/length(AreaSB2),'b-')
[p x]=hist(log10(AreaSB3.^1.5));
plot(x(1:end-1),p(1:end-1)/length(AreaSB3),'b-')
[p x]=hist(log10(AreaSB4.^1.5));
plot(x(1:end-1),p(1:end-1)/length(AreaSB4),'b-')
[p x]=hist(log10(AreaSB5.^1.5));
plot(x(1:end-1),p(1:end-1)/length(AreaSB5),'b-')
[p x]=hist(log10(AreaSB6.^1.5));
plot(x(1:end-1),p(1:end-1)/length(AreaSB6),'b-')

%% 

VSB(1)=1.28^3 * 4/3*sqrt(pi)*median(AreaSB1)^1.5;
VSB(2)=1.28^3 * 4/3*sqrt(pi)*median(AreaSB2)^1.5;
VSB(3)=1.28^3 * 4/3*sqrt(pi)*median(AreaSB3)^1.5;
VSB(4)=1.28^3 * 4/3*sqrt(pi)*median(AreaSB4)^1.5;
VSB(5)=1.28^3 * 4/3*sqrt(pi)*median(AreaSB5)^1.5;
VSB(6)=1.28^3 * 4/3*sqrt(pi)*median(AreaSB6)^1.5;

VCB(1)=1.28^3 * 4/3*sqrt(pi)*median(AreaCB1)^1.5;
VCB(2)=1.28^3 * 4/3*sqrt(pi)*median(AreaCB2)^1.5;
VCB(3)=1.28^3 * 4/3*sqrt(pi)*median(AreaCB3)^1.5;
VCB(4)=1.28^3 * 4/3*sqrt(pi)*median(AreaCB4)^1.5;
VCB(5)=1.28^3 * 4/3*sqrt(pi)*median(AreaCB5)^1.5;
VCB(6)=1.28^3 * 4/3*sqrt(pi)*median(AreaCB6)^1.5;

for i=1:6
    NSB(i)=10^9*WeightSB(i)/VSB(i);
    NCB(i)=10^9*WeightCB(i)/VCB(i);
end

['SB, volume: ' num2str(round(mean(VSB))) ' +- ' num2str(round(std(VSB)/sqrt(6)))]
['CB, volume: ' num2str(round(mean(VCB))) ' +- ' num2str(round(std(VCB)/sqrt(6)))]

['SB, #cells: ' num2str(round(mean(NSB))) ' +- ' num2str(round(std(NSB)/sqrt(6)))]
['CB, #cells: ' num2str(round(mean(NCB))) ' +- ' num2str(round(std(NCB)/sqrt(6)))]

%% 
imagedir = '/Volumes/labdata/mary/';
experimentdir = [imagedir,'171220_FatHistology/'];
datadir = [experimentdir,'Data/'];
imagedir1 = [datadir,'ShamE/'];
Files=dir(imagedir1);
AreaSE1=[];AreaSE2=[];AreaSE3=[];AreaSE4=[];AreaSE5=[];AreaSE6=[];
for i=3:length(Files)
    load([imagedir1 Files(i).name]);
    s1=size(finaldata);
    clear d
    for num1=1:s1
        d(num1)=finaldata(num1).Area;
    end
    if i<16
        len=length(AreaSE1);
        AreaSE1(len+1:len+s1)=d;
    elseif i<31
        len=length(AreaSE2);
        AreaSE2(len+1:len+s1)=d;
    elseif i<46
        len=length(AreaSE3);
        AreaSE3(len+1:len+s1)=d;
    elseif i<61
        len=length(AreaSE4);
        AreaSE4(len+1:len+s1)=d;
    elseif i<76
        len=length(AreaSE5);
        AreaSE5(len+1:len+s1)=d;
    else
        len=length(AreaSE6);
        AreaSE6(len+1:len+s1)=d;
    end         
end


imagedir = '/Volumes/labdata/mary/';
experimentdir = [imagedir,'171220_FatHistology/'];
datadir = [experimentdir,'Data/'];
imagedir1 = [datadir,'CortE/'];
Files=dir(imagedir1);

AreaCE1=[];AreaCE2=[];AreaCE3=[];AreaCE4=[];AreaCE5=[];AreaCE6=[];
for i=3:length(Files)
    load([imagedir1 Files(i).name]);
    s1=size(finaldata);
    clear d
    for num1=1:s1
        d(num1)=finaldata(num1).Area;
    end
    if i<16
        len=length(AreaCE1);
        AreaCE1(len+1:len+s1)=d;
    elseif i<31
        len=length(AreaCE2);
        AreaCE2(len+1:len+s1)=d;
    elseif i<46
        len=length(AreaCE3);
        AreaCE3(len+1:len+s1)=d;
    elseif i<61
        len=length(AreaCE4);
        AreaCE4(len+1:len+s1)=d;
    elseif i<76
        len=length(AreaCE5);
        AreaCE5(len+1:len+s1)=d;
    else
        len=length(AreaCE6);
        AreaCE6(len+1:len+s1)=d;
    end
end
VSE(1)=1.28^3 * 4/3*sqrt(pi)*median(AreaSE1)^1.5;
VSE(2)=1.28^3 * 4/3*sqrt(pi)*median(AreaSE2)^1.5;
VSE(3)=1.28^3 * 4/3*sqrt(pi)*median(AreaSE3)^1.5;
VSE(4)=1.28^3 * 4/3*sqrt(pi)*median(AreaSE4)^1.5;
VSE(5)=1.28^3 * 4/3*sqrt(pi)*median(AreaSE5)^1.5;
VSE(6)=1.28^3 * 4/3*sqrt(pi)*median(AreaSE6)^1.5;

VCE(1)=1.28^3 * 4/3*sqrt(pi)*median(AreaCE1)^1.5;
VCE(2)=1.28^3 * 4/3*sqrt(pi)*median(AreaCE2)^1.5;
VCE(3)=1.28^3 * 4/3*sqrt(pi)*median(AreaCE3)^1.5;
VCE(4)=1.28^3 * 4/3*sqrt(pi)*median(AreaCE4)^1.5;
VCE(5)=1.28^3 * 4/3*sqrt(pi)*median(AreaCE5)^1.5;
VCE(6)=1.28^3 * 4/3*sqrt(pi)*median(AreaCE6)^1.5;

for i=1:6
    NSE(i)=10^9*WeightSE(i)/VSE(i);
    NCE(i)=10^9*WeightCE(i)/VCE(i);
end

['SE, volume: ' num2str(round(mean(VSE))) ' +- ' num2str(round(std(VSE)/sqrt(6)))]
['CE, volume: ' num2str(round(mean(VCE))) ' +- ' num2str(round(std(VCE)/sqrt(6)))]

['SE, #cells: ' num2str(round(mean(NSE))) ' +- ' num2str(round(std(NSE)/sqrt(6)))]
['CE, #cells: ' num2str(round(mean(NCE))) ' +- ' num2str(round(std(NCE)/sqrt(6)))]
