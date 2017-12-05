%% JUST T1
% Only significiant results found for T1 (not T1/T2)
% T1 normalised across subs and then taking the mean of all subs

N = 98;
for i = 1:N
    subid = subfile.subs98.subs98(i);
    T1mat(i,:) = givemeT1(subid);
end

%% normalize
zT1mat = zscore(T1mat,[],2);
meanT1 = mean(zT1mat)
meanT1 = meanT1(1:34)'

%% correlations
[r,p] = corr(grpWD,meanT1,'type','spearman')% r = .4371 p = .0103
[rH,pH] = corr(grpHFP,meanT1,'type','spearman') % r = -.465 p = .006

%% scatters
figure;scatter(meanT1,groupWD,'linewidth',2);
lsline;
xlabel('Standardised T1')
ylabel('Weighted Degree')
title(r)

figure;scatter(meanT1,grpHFP,'linewidth',2);
lsline;
xlabel('Standardised T1')
ylabel('High Frequency Power')
title(rH)
