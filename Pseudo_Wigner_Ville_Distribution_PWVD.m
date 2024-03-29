% Pseudo-Wigner distribution (PWVD)

% This code is related to the following section of [the paper](https://arxiv.org/abs/2403.17181):
%
% Section III:  SIGNAL TRANSFORMATION AND ANALYSIS
% G. Wigner–Ville Distribution
%
% For more details please refer to the paper at: https://arxiv.org/abs/2403.17181.

x = table2array(readtable('c(t).csv')); % Load composite sinusoidal signal
fs = 500; % Sampling frequency
t = (0:length(x)-1)/fs; % Time vector

plot(t,x) % Plot the signal.

figure;
wvd(x,fs, "smoothedPseudo"); % PWVD

