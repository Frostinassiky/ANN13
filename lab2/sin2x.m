approximationFunction = @(x) (sin(2*x));
%eta = 0.5;% we don't actually use eta now since we don't update teh weigths in the first assignment but just compue the weights once
%functionSteps = 100;
numberOfUnits = 6;
rbfapproximation;

figure;
hold;
for unitI=1:numberOfUnits,
    plot(patterns,W(unitI)*Phi(:,unitI));
    %pause();
end
title(['Transfer functions for RBFs using ', int2str(numberOfUnits), ' units']);
%W