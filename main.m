%% Correlating group WD and HFP
% Load data
group_vol;
group_HFP;
grpWD = groupWD;

%Partial Correlation (controlling for region volume)
[r,p,resids] = partialcorr_with_resids(grpHFP,grpWD,grpVOL,'type','Spearman');

% Scatter plot of residual WD against residual HFP
figure;scatter(resids(:,1),resids(:,2),'linewidth',2);
lsline;
xlabel('High Frequency Power residual')
ylabel('Weighted Degree residual')
title(r)

%% Correlating WD with other frequency bands
groupbands; % default number of bands = 14 (~0.5 Hz bands)

% Partial correlation between group WD and group frequency bands
for j = 1:numBands
    [r(j) p(j)] = partialcorr(band(j).grp,grpWD,grpVOL,'type','spearman');
end

% Plot correlations across bands
marker = [0.5:14];
figure;plot(marker,r,'-bo','linewidth',2,'MarkerSize',8); 
line([0 14],[0 0])
xlabel('Frequency Band (Hz)')
xticks([0:14])
xticklabels(linspace(0,.6944,15))
xtickangle(90)
ylabel('Spearman Correlation')
title('Correlation between WD and 14 Frequency Bands')
ylim([-0.7 0.7])

%% Individual v Group v Mismatched
mismatched; % gives histogram of mismatched v matched correlations
% warning: takes 30+ minutes to run

%% T1
group_T1; % gives scatter of normalised T1 and HFP/WD


