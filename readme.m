% main.m - all the main analysis from John's thesis, should work after
% downlaoding all data (see below)

% Section 1: Correlating Weighted Degree (WD) and High Frequency Power
% (HFP) - the proportion of power in the top fifth of frequencies
% (0.56 - 0.59Hz)
% Section 2: Correlating WD with 14 other frequency bands (approx. .05 Hz
% bands)
% Section 3: Individual v group v mismatched - compares correlations
% between WD and HFP using group averaged data, compared to individually
% matched and mismatched data. *Takes 30+ minutes to run
%Section 4: T1 - correlates normalised T1 with WD and HFP

%% Where to get data
% FUNCTIONAL
% /kg98/john/data/functional/{SUB_ID}-cfg.mat
% 
% STRUCTURAL
% /kg98/john/data/structural/conn_data_100.mat
% 4 different connectomes
% SIFT2_density*, SIFT2_connectome, standard_density, standard_connectome
% *used in John’s thesis
% 
% REGION VOLUME
% /kg98/john/data/volume/{SUB_ID}.nii.gz
% 
% T1
% /kg98/john/data/t1t2/T1T2_mean_roi_values.mat
