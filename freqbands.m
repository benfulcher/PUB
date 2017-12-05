function out = freqbands(y,samplingPeriod,numBands)

if nargin < 2
    samplingPeriod = 2; % (s)
end

% Get the frequency index
sampleFreq 	 = 1/samplingPeriod;
sampleLength = length(y);
paddedLength = 2^nextpow2(sampleLength);

%% Detrend before fft
y = detrend(y);

% Zero padding
y = [y; zeros(paddedLength - sampleLength,1)];

% Perform FFT:
Y = (2*abs(fft(y)).^2)/sampleLength;


%% Compute fALFF measure:
bandRange = [0 sampleFreq/2];
bandIntervals = linterp([0 1], bandRange, 0:(1/numBands):1);
out.band = zeros(1,numBands);

for i=1:numBands
    LCO = bandIntervals(i);
    HCO = bandIntervals(i+1);

    idx_LCO = ceil(LCO * paddedLength * samplingPeriod + 1);
    idx_HCO = floor(HCO * paddedLength * samplingPeriod + 1);

    out.band(i) = sum(Y(idx_LCO:idx_HCO)) / sum(Y(2:(paddedLength/2 + 1)));
end

end
