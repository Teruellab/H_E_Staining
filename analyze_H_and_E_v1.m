%% 
clear all
close all
imagedir = '/Volumes/labdata/mary/';
experimentdir = [imagedir,'171220_FatHistology/'];
datadir = [experimentdir,'Data/'];
imagedir1 = [datadir,'ShamB/'];
Files=dir(imagedir1);
WeightSB(1:6)=[459.5 385 474.6 401.8 594.5 597.5];
WeightCB(1:6)=[1357.2 840.4 1210.8 1366.6 1000.3 646];
WeightSE(1:6)=[226.4 208.9 202 212.5 328.9 330.7];
WeightCE(1:6)=[621.2 397.1 670.5 686.9 375.7 340.4];

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

AreaSB=[];
for i=3:length(Files)
    load([imagedir1 Files(i).name]);
    s1=size(finaldata);
    clear d
    for num1=1:s1
        d(num1)=finaldata(num1).Area;
    end
    AreaSBmedian(i)=median(d);
    AreaSBcorr(i)=10000*WSB(i-2)/(4/3/sqrt(pi)*median(d)^1.5);
    len=length(AreaSB);
    AreaSB(len+1:len+s1)=d;
end
figure,hist(AreaSB,0:50:10000)

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
    AreaCBmedian(i)=median(d);
    AreaCBcorr(i)=10000*WCB(i-2)/(4/3/sqrt(pi)*median(d)^1.5);
    len=length(AreaCB);
    AreaCB(len+1:len+s1)=d;
end
figure,hist(AreaCB,0:50:10000)
'Cort, #cells:'
[mean(AreaCBcorr) std(AreaCBcorr)/sqrt(length(AreaCBcorr))]
'Sham #cells:'
[mean(AreaSBcorr) std(AreaSBcorr)/sqrt(length(AreaSBcorr))]
%% 

shammice=[1 2 3 7 8 9]; 
cortmice=[13 14 15 22 23 24];
nmice=size(mice,2);
slice=[1 2 3];
nslice=size(slice,2);
m(1:mice,1:nslice,1:5)=0;
for i=1:nmice
    for j=1:nslice
        if (i==1)
            site=[2 3 4 5]
        else 
            site=[1 2 3 4 5]
        end
        nsites=size(site,2)
        clear d
        clear s1
        clear s2
        for k=1:nsites
         %   ([datadir,num2str(mice(i)),'B_',num2str(slice(j)),'_',num2str(site(k)),'_FinalData.mat'])
            load([imagedir1,num2str(mice(i)),'B_',num2str(slice(j)),'_',num2str(site(k)),'_FinalData.mat'])
            s1=size(finaldata,1);
            for num1=1:s1
                d(num1)=finaldata(num1).Area;
            end
        % figure
        %    hist(d(:),100)
            m(i,j,k) = median(d);
        
        end
    end
end
%% 

for i=1:nmice
    for j=1:nslice
        for k=1:nsites
    printf('mouse= %d, slice=%d, site=%d, median=%d',i,j,k,m(i,j,k));
        end
    end
end
%% 
   