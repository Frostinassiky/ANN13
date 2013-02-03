approximationFunction = @(x) (square(2*x));
maxUnits = 63;
for numberOfUnits=1:maxUnits, 
%numberOfUnits = 59; %With 63 units we will have as many hidden units as the size of the input/patterns, i.e. we have one hidden node for each input and that's why we get sucha good fit
rbfapproximation;


err = max(abs(targets-y));
    if err < 0.1,
        disp(['Units ', int2str(numberOfUnits), ' Error: ',num2str(err)])
    end
end