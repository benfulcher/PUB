function [SCMat] = givemeSC(subID,edgeType)

if nargin < 2
   edgeType = 'SIFT2_density';
end

inFile = load('conn_data_100.mat');

indx = (inFile.subs==subID);

switch edgeType
    case 'SIFT2_density'
        SCMat = inFile.SIFT2_density{indx};
    case 'SIFT2_connectome'
        SCMat = inFile.SIFT2_connectome{indx};
    case 'standard_connectome'
        SCMat = inFile.standard_connectome{indx};
    case 'standard_density'
        SCMat = inFile.standard_density{indx};
    otherwise
        error('Unknown edge type: ''%s''',edgeType);
end

end
