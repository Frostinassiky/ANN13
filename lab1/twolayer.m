function errors = twolayer( patterns, targets, nHiddenLayers, epochs, eta,momentum, Wstart, Vstart)

%One weight for each connection between datapoint in pattern and
%nHiddenLayers

%initlaize W and V depending on patterns/output size and nHiddenLayers

[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);
X = [patterns ; ones(1,ndata)];
W = Wstart;
V = Vstart;
dW = zeros(size(W,1),size(W,2));
dV = zeros(size(V,1),size(V,2));

errorC = zeros(1,epochs);
errorE = zeros(1,epochs);

for i=1:epochs,
[Oout, Hout] = forwardpass(X, W, V);
[delta_H, delta_O] = backwardpass(Oout, Hout, V, targets, nHiddenLayers);
[W, V, dW, dV] = weightupdate(delta_H, delta_O, Hout, momentum, eta, dW, dV, W, V, X);

errorC(i) = sum(sum(abs(sign(Oout) - targets)./2));
errorE(i) = 0.5 * sum(sum((Oout-targets).^2));
end
%x = 1:epochs;
%plot(x,errorE);

errorClassified = errorC;
errorEuclidan = errorE;
errors = [errorEuclidan; errorClassified];
%O = sign(Oout)
%WX = sign(rho(W*X))

end 
