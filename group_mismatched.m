% load subfile
subfile = load('subs98.mat'); 
N = size(subfile.subs98,1) % number of subs

%% MISMATCHED HFP and WD 
% Correlate each partiicpants HFP with the entire set of mismatched WDs.
% I.e. for sub 1, correlate their HFP with all other 97 participant's WDs,
% while controlling for sub 1's region volume

for i = 1:N
    subid_i = subfile.subs98.subs98(i);
    HFP = getfreq5(subid_i);
    for j = 1:(N-1)
        subid_j = subfile.subs98.subs98(j+(j>=i));
        WD = getWD(subid_j);
        VOL = getVOL(subid_j);
        corrs(i).mat(j) = partialcorr(HFP,WD,VOL,'type','spearman');
    end
end

% Mean across all mismatched corrs
for i = 1:N
    mismatched(i) = mean(corrs(i).mat); 
    mismatched_std(i) = std([corrs(i).mat mismatched(i)]);
end

mismatched_mean = mean(mismatched); % mean mismatched correlation for all subs


%% MATCHED HFP and WD
% correlate each subs HFP with their own matched WD
for i = 1:N
    subid = subfile.subs98.subs98(i);
         
    WD = getWD(subid);
    HFP = getfreq5(subid);
    VOL = getVOL(subid);
     
    [sub_H1R, sub_H1P] = partialcorr(HFP,WD,VOL,'type','spearman');
    matched(i) = sub_H1R;
    matched_P(i) = sub_H1P;
end

% mean matched
matched_mean = mean(matched)


%% HISTOGRAMS
h = histogram(matched)
hold on
histogram(mismatched,h.BinEdges)
legend('Matched','Mismatched')
title('Correlation between HFP and WD (Matched v Mismatched)')
ylabel('Number of Participants')
xlabel('Partial Spearman Correlation')
hold off

