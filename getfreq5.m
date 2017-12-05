function amp = getfreq5(subID,maxL,whichHemispheres,doRandomize)
% Returns HFP
%-------------------------------------------------------------------------------

% If only input subID
if nargin < 2
    maxL = -1;
end
if nargin < 3
    whichHemispheres = 'left'; % 'right','both','left'
end
if nargin < 4
    doRandomize = false;
end

%% Load in functional data
timeSeriesData = givemeTS(subID,whichHemispheres,doRandomize);

% Normalize the data so every time series has mean 0 and std of 1:
if maxL<0
    maxL=size(timeSeriesData,1);
end


numRegions = size(timeSeriesData,2);
numBands = 5;
amp = zeros(numRegions,1);

for i = 1:numRegions
    spectralProperties = freqbands(timeSeriesData(:,i),864/1200,numBands);
    amp(i,1) = spectralProperties.band(:,5);
end

end
