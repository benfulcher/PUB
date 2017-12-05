function timeSeriesData = givemeTS(subID,whichHemispheres,doRandomize)
% Load rs-fMRI time series for a given subject
%-------------------------------------------------------------------------------

if nargin < 2
    whichHemispheres = 'left';
end
if nargin < 3
    doRandomize = false;
end

%-------------------------------------------------------------------------------
% Load in data from file
%-------------------------------------------------------------------------------
cd ./func_data_100;
fileName = [ num2str(subID) '-cfg.mat'];
fileName = sprintf('%u-cfg.mat',subID);

inFile = load(fileName);
timeSeriesDataRaw = inFile.cfg.roiTS{1};
[numTime,numRegions] = size(timeSeriesDataRaw); % time x region

fprintf(1,'%u regions, %u time points\n',numRegions,numTime);

%-------------------------------------------------------------------------------
% z-score data and filter by hemisphere:
%-------------------------------------------------------------------------------
% Normalize the data so every time series has mean 0 and std of 1:

timeSeriesData = zscore(timeSeriesDataRaw);

if doRandomize
    fprintf(1,'RANDOMIZING TIME-SERIES STRUCTURE??!?!?!\n')
    % Independently randomize each region
    for i = 1:numRegions
        timeSeriesDataRaw(:,i) = timeSeriesDataRaw(randperm(numTime),i);
    end
    timeSeriesData = zscore(timeSeriesDataRaw);
end

%-------------------------------------------------------------------------------
%% Filter hemisphere:
%-------------------------------------------------------------------------------
switch whichHemispheres
    case 'both'
        % Don't filter
    case 'left'
        timeSeriesData = timeSeriesData(:,1:end/2);
        fprintf(1,'We filtered from %u to %u regions\n',...
            size(timeSeriesDataRaw,2),size(timeSeriesData,2))
    case 'right'
        timeSeriesData = timeSeriesData(:,((end/2)+1):end);
        fprintf(1,'We filtered from %u to %u regions\n',...
            size(timeSeriesDataRaw,2),size(timeSeriesData,2))
end

% Return to home directory
cd ../

end
