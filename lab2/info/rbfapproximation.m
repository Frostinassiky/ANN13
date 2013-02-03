%function rbfapproximation ( approximationFunction, functionSteps, numberOfUnits, eta)
%can't use functions since we need to call maerbf with global variable

%steps = functionSteps;
%patterns = linspace(0, 2*pi, steps);
patterns = 0:0.1:2*pi; %ansers to questions will differ a little depending on step size, but step size 0.1 was the suggested value in the lab notes
targets = approximationFunction(patterns)';

%plot(patterns,targets);

%Prepare call to makerbf that inializes the RBF units
%Input to makerbf
x = patterns';
units = numberOfUnits;
makerbf;

%use output from makerbf to compue Phi in equation 5 of the lab notes
Phi = calcPhi(x,m,var);
W = Phi\targets; %least square solution

y = Phi*W;

rbfplot1(patterns,y,targets,units);

