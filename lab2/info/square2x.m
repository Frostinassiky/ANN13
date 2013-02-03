approximationFunction = @(x) (square(2*x));
numberOfUnits = 62; %With 63 units we will have as many hidden units as the size of the input/patterns, i.e. we have one hidden node for each input and that's why we get sucha good fit
rbfapproximation;