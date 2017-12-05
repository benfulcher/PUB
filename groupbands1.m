%%
subfile = load('C:\Users\John Fallon\Desktop\MATLAB\Analysis\subs98.mat');

%% loop over bands
N = 98;
numBands = 14;

for j = 1:numBands
for i = 1:N
    subid = subfile.subs98.subs98(i);
    bands = getfreq(subid);
    band(j).mat(:,i) = bands(j).band;
end 
end 

%% calculate means
for j = 1:numBands
    band(j).grp = mean(band(j).mat,2);
end 

%% Correlations
for j = 1:numBands
    [r(j) p(j)] = corr(band(j).grp,grpWD,'type','spearman')
end

%% partial corr
for j = 1:numBands
    [r(j) p(j)] = partialcorr(band(j).grp,grpWD,groupVOL,'type','spearman')
end

%% plot correlations across bands
abc = [0.5:14]
plot(abc,r,'-bo','linewidth',2,'MarkerSize',8); %make this look nicer
line([0 14],[0 0])
xlabel('Frequency Band (Hz)')
xticks([0:14])
xticklabels(linspace(0,.6944,15))
xtickangle(90)
ylabel('Spearman Correlation')
title('Correlation between WD and 14 Frequency Bands')
ylim([-0.7 0.7])
