subfile = load('subs98.mat');

%% group HFP
N = 98;
for i = 1:N
    subid = subfile.subs98.subs98(i);
    HFPmat(:,i) = getfreq5(subid);
end

%% 
grpHFP = mean(HFPmat,2);
