function [VOLMat] = givemeVOL(subID)
cd ./vol_data_100
filename = [num2str(subID) '.nii.gz'];
inFile = load_nii(filename);
cd ../
VOL = inFile.img;

i = 1;
for j=[1001:1035,2001:2035];
    if j ~= [1004,2004];
    VOLMat(i) = nnz(VOL==j);
    i = i+1;
    end
end
end