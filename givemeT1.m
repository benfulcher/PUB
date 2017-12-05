function T1mat = givemeT1(subID)

inFile = load ('C:\Users\John Fallon\Desktop\MATLAB\data_100\T1T2_mean_roi_values.mat');
indx = (inFile.subs==subID);

T1T2mat = inFile.sub_T1T2{indx};
T1mat = T1T2mat(:,1)
end
