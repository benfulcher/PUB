% load subfile
subfile = load('subs98.mat'); 

N = size(subfile.subs98,1); % number of subs
numBands = 14; % 14 ~ .05 Hz bands

for j = 1:numBands
for i = 1:N
    subid = subfile.subs98.subs98(i);
    bands = getfreq(subid,numBands);
    band(j).mat(:,i) = bands(j).band;
end 
end 

% group averages
for j = 1:numBands
    band(j).grp = mean(band(j).mat,2);
end 