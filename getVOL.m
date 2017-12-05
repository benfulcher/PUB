function VOL = getVOL(subID)
%% Settings
whichHemispheres = 'left'; % 'right','both','left'

% load the data
featuresVOL = givemeVOL(subID)';

switch whichHemispheres
    case 'both'
        featuresVOL = givemeVOL(subID);
    case 'left'
        VOL = featuresVOL(1:34,1);
    case 'right'
        featuresVOL = featuresVOL(35:68,1);
end

end