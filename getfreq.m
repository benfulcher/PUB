function out = getfreq(subID,numBands)
%% Settings
whichHemispheres = 'left'; % 'right','both','left'
%% Load in functional data
timeSeriesDataRaw = givemeTS(subID);
% Normalize the data so every time series has mean 0 and std of 1:
timeSeriesData = zscore(timeSeriesDataRaw);

numRegions = size(timeSeriesData,2);
amp = zeros(numRegions,numBands);

for i = 1:numRegions
    spectralProperties = freqbands(timeSeriesData(1:1200,i),864/1200,numBands);
    amp(i,:) = spectralProperties.band(:);
end

for j = 1:numBands
    out(j).band = amp(:,j);
end



end
