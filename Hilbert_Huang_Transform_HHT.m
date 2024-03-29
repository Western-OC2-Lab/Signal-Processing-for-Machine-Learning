% Hilbert–Huang Transform

% This code is related to the following section of [the paper](https://arxiv.org/abs/2403.17181):
%
% Section III:  SIGNAL TRANSFORMATION AND ANALYSIS
% F. Hilbert–Huang Transform
% 2) Hilbert Spectral Analysis
%
% For more details please refer to the paper at: https://arxiv.org/abs/2403.17181.

x = table2array(readtable('s3(t).csv')); % Load composite sinusoidal signal
fs = 1600; % Sampling frequency
t = (0:length(x)-1)/fs; % Time vector

plot(t,x) % Plot the signal.


[imf,residual,info] = emd(x); % apply EMD


figure;
hht(imf,fs) % HHT (hilbert sepectrum)




