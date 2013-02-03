approximationFunction = @(x) (x); %We see that RBF works best for periodic functions when approximating a linear function
numberOfUnits = 8;
rbfapproximation;

figure;
approximationFunction = @(x) (sqrt(x)); %We see that RBF works best for periodic functions when approximating a linear function
numberOfUnits = 8;
rbfapproximation;