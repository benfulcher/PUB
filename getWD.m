function WD = getWD(subID,whichHemispheres,edgeType)

if nargin < 2
    whichHemispheres = 'left';
end
if nargin < 3
    edgeType = 'SIFT2_density';
    fprintf(1,'USING SIFT2_density BY DEFAULT\n');
end

% Load in data
connDataWeighted = givemeSC(subID,edgeType);

% Get ROI conn data
switch whichHemispheres
    case 'both'
        connDataWeighted = givemeSC(subID);
    case 'left'
        connDataWeighted = connDataWeighted(1:34,1:34);% just take first half of nodes
    case 'right'
        connDataWeighted = connDataWeighted';
        connDataWeighted = connDataWeighted(1:34,1:34);
end

WD = sum(connDataWeighted)';

end
