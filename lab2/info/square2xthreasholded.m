approximationFunction = @(x) (square(2*x));
numberOfUnits = 6; 

patterns = 0:0.1:2*pi; 
targets = approximationFunction(patterns)';
x = patterns';
units = numberOfUnits;
makerbf;
Phi = calcPhi(x,m,var);
W = Phi\targets; 
y = Phi*W;

%transform output so that we threashold it to 0 or 1.
y = sign(y);

rbfplot1(patterns,y,targets,units);
