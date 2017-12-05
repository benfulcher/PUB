subfile = load('subs98.mat');
%% group volume matrix (34X98)
N = 98;
for i = 1:N
    subid = subfile.subs98.subs98(i);
    VOLmat(:,i) = getVOL(subid);
end

%% group volume means (34X1)
grpVOL = mean(VOLmat,2);