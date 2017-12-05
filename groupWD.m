function [grpWD,WDmat] = groupWD(whichHemispheres,edgeType)
% Compute group-mean weighted degree
%-------------------------------------------------------------------------------
if nargin < 1
    whichHemispheres = 'left';
end
if nargin < 2
    edgeType = 'SIFT2_density';
end

% Load in subjects:
subfile = load('subs98.mat');
subIDList = subfile.subs98.subs98; % vector of data

% Get number of regions from getWD:
test = getWD(subIDList(1),whichHemispheres,edgeType);
numRegions = length(test);

%% group connectome
numSubjects = length(subIDList);
WDmat = zeros(numRegions,numSubjects);
for i = 1:numSubjects
    WDmat(:,i) = getWD(subIDList(i),whichHemispheres,edgeType);
end

% mean to get group connectome:
grpWD = mean(WDmat,2);
end


