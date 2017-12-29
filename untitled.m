%% 
clear all
close all
imagedir = '/Volumes/labdata/michael/Fixed Cell Experiments/';
experimentdir = [imagedir,'2017/20171215-FatHistology/'];
datadir = [experimentdir,'Data/'];
mice=[1 2 3]; 
slice=[1 2 3];
n_mice=12;
for i=1:size(mice,2)
    i
    clear site
    for j=1:size(slice,2)
        j
        if (i==1)
            site=[2 3 4 5]
        else 
            site=[1 2 3 4 5]
        end
        for k=1:size(site,2)
            k
            ([datadir,num2str(mice(i)),'B_',num2str(slice(j)),'_',num2str(site(k)),'_FinalData.mat'])
            load([datadir,num2str(mice(i)),'B_',num2str(slice(j)),'_',num2str(site(k)),'_FinalData.mat'])
        end
    end
end
%% 
    shot = [num2str(rows(row)),'_',num2str(cols(col)),'_',num2str(sites(site))];
    load([datadir,'1B_1_2_FinalData'.mat']);
    pparg = fixdata(:,6);
    dnacontent = fixdata(:,4);
    ppargwell = [ppargwell; pparg];
    dnawell = [dnawell; dnacontent];
end
cellcount(row,col) = numel(dnawell);
badPparg = ppargwell > 1000;
badcells =  badPparg;
dnawell(badcells) = [];
ppargwell(badcells) = [];
tempcondition = [tempcondition; ppargwell];
percdiffplate(row,col,plate) = (sum(ppargwell>ppargThresholdGuess)*100)/numel(ppargwell);
ppargplate{row,col} = ppargwell;

[s1 s2]=size(finaldata);
for i=1:s1
d(i)=finaldata(i).Area;
end
figure
hist(d,100)
median(d)