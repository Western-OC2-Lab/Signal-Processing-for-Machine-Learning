% Empirical Mode Decomposition (EMD)

% This code is related to the following section of [the paper](https://arxiv.org/abs/2403.17181):
%
% Section III:  SIGNAL TRANSFORMATION AND ANALYSIS
% F. Hilbert–Huang Transform
% 1) Empirical Mode Decomposition (EMD)
%
% For more details please refer to the paper at: https://arxiv.org/abs/2403.17181.

x = table2array(readtable('vib.csv')); % Load random vibration signal
% he vibration signal extracted from the PU dataset: 
% https://mb.uni-paderborn.de/en/kat/main-research/datacenter/bearing-datacenter/data-sets-and-download

fs = 64000; % Sampling frequency
t = (0:length(x)-1)/fs; % Time vector

plot(t,x) % Plot the signal.

x = x - mean(x); % Remove mean (DC component).

% Perform Empirical Mode Decomposition (EMD)
[imfs, residual] = emd(x);

% Number of IMFs
numIMFs = size(imfs, 2);

% Figure setup for plotting
figure;

% Iterate over each IMF
for i = 1:numIMFs
    % Time-domain plot of the IMF
    subplot(numIMFs+1, 2, 2*i-1);
    plot(imfs(:, i));
    title(['IMF ', num2str(i)]);
    set(gca, 'XTick', [], 'YTick', []); % Remove axis labels
    
    % Frequency-domain plot (FFT) of the IMF
    subplot(numIMFs+1, 2, 2*i);
    n = length(imfs(:, i)); % Number of points in IMF
    fft_imf = fft(imfs(:, i));
    P2 = abs(fft_imf/n);
    P1 = P2(1:n/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = fs*(0:(n/2))/n;
    plot(f, P1);
    title(['FFT of IMF ', num2str(i)]);
    set(gca, 'XTick', [], 'YTick', []); % Remove axis labels
end

% Plot for the residual
subplot(numIMFs+1, 2, 2*numIMFs+1);
plot(residual);
title('Residual');
set(gca, 'XTick', [], 'YTick', []);

% FFT for the residual
subplot(numIMFs+1, 2, 2*numIMFs+2);
n = length(residual);
fft_residual = fft(residual);
P2 = abs(fft_residual/n);
P1 = P2(1:n/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(n/2))/n;
plot(f, P1);
title('FFT of Residual');
set(gca, 'XTick', [], 'YTick', []);
