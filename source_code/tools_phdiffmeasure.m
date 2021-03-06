function PhDiff = tools_phdiffmeasure(x, y)
%{

##tools_phdiffmeasure:
Measure phase difference between two signals

##Environment requirement:
This code was developed under Red Hat Enterprise Linux environment.

##Usage:
PhDiff = tools_phdiffmeasure(x, y)

##Inputs:
x: first signal in the time domain
y: second signal in the time domain

##Output:
PhDiff: phase difference Y -> X in radian

##Available from:
https://www.mathworks.com/matlabcentral/fileexchange/48025-phase-difference-measurement-with-matlab-implementation

##References:
[1] M. Sedlacek, M. Krumpholc. “Digital measurement of phase difference – a comparative study of DSP algorithms”. 
Metrology and Measurement Systems, Vol. XII, No. 4, pp. 427-448, 2005.

[2] M. Sedlacek. “Digital Measurement of Phase Difference of LF Signals A Comparison of DSP Algorithms”. 
Proceedings of XVII IMEKO World Congress, pp. 639-644, 2003.

##History:
1.00 - 12/01/2014 - Hristo Zhivomirov - create the original file

##Version:
1.00

%}

% represent x as column-vector if it is not
if size(x, 2) > 1
    x = x';
end

% represent y as column-vector if it is not
if size(y, 2) > 1
    y = y';
end

% remove the DC component
x = x - mean(x);
y = y - mean(y);

% signals length
N = length(x);

% window preparation
win = rectwin(N);

% fft of the first signal
X = fft(x.*win);

% fft of the second signal
Y = fft(y.*win);

% phase difference calculation
[~, indx] = max(abs(X));
[~, indy] = max(abs(Y));
PhDiff = angle(Y(indy)) - angle(X(indx));

end
