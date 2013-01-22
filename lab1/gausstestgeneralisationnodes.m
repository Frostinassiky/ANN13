x=[-5:1:5]';
y=x;
z=exp(-x.*x*0.1) * exp(-y.*y*0.1)' - 0.4;
targets = reshape (z, 1, size(z,1)*size(z,2));
[xx, yy] = meshgrid (x, y);
patterns = [reshape(xx, 1, size(xx,1)*size(xx,2)); reshape(yy, 1, size(yy,1)*size(yy,2))];
allPatterns = patterns;
allTargets = targets;

%nPoint = round(size(allTargets,2)*0.2);
%nPoint = 25;
%nPoint = 25;
nPoint = 25;
layersArray = [1:2:50];
trainingError = zeros(1,size(layersArray,2));
validationError = zeros(1,size(layersArray,2));
epochs = 1000;
iters = 300;
eta=0.01;
momentum=0.9;
ndata = nPoint;
    
for runs=1:iters,
    
    permute = randperm(size(allPatterns,2));
    allPatterns = allPatterns(:,permute);
    allTargets = allTargets(:,permute);
    patterns = allPatterns(:,1:nPoint);
    targets = allTargets(:,1:nPoint);
    j = 1;
    for nHiddenLayers = layersArray,
        
        X = [patterns ; ones(1,ndata)];
        W = randn(nHiddenLayers, insize + 1);
        V = randn(outsize, nHiddenLayers + 1);
        dW = zeros(size(W,1),size(W,2));
        dV = zeros(size(V,1),size(V,2));

        for i=1:epochs,
            [Oout, Hout] = forwardpass(X, W, V);
            [delta_H, delta_O] = backwardpass(Oout, Hout, V, targets, nHiddenLayers);
            [W, V, dW, dV] = weightupdate(delta_H, delta_O, Hout, momentum, eta, dW, dV, W, V, X);
        end
        trainingError(j) = trainingError(j) + 0.5 * sum(sum((Oout-targets).^2));
        [ValOout, ValHout] = forwardpass([allPatterns; ones(1,size(allTargets,2))], W, V);
        validationError(j) = validationError(j) + 0.5 * sum(sum((ValOout-allTargets).^2));
        j = j + 1;
    end
    if mod(runs,10)==0,
       disp('Number of runs done')
       disp(runs)
    end
end

trainingError = trainingError./numel(trainingError);
validationError = validationError./numel(validationError);

plot(layersArray,trainingError, '-ro', layersArray,validationError, '-bo');
title(['Number of training points ', int2str(nPoint), '. Number of iterations: ', int2str(iters), '. Number of epochs: ' int2str(epochs)])
legend('Training error','Validation error');
xlabel('Hidden nodes'); ylabel('Euclidean error');
drawnow;

