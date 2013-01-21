function twolayer( patterns, targets, nHiddenLayers, epochs)

%One weight for each connection between datapoint in pattern and
%nHiddenLayers

%initlaize W and V depending on patterns/output size and nHiddenLayers

[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);
X = [patterns ; ones(1,ndata)];
W = randn(nHiddenLayers, insize + 1); %hmm, size correct? 
V = randn(outsize, nHiddenLayers + 1); %hmm, size correct? Add one for bias?
dW = zeros(size(W,1),size(W,2));
dV = zeros(size(V,1),size(V,2));

momentum = 0.9;
eta = 0.001;

error = zeros(1,epochs);

for i=1:epochs,
[Oout, Hout] = forwardpass(X, W, V);
[delta_H, delta_O] = backwardpass(Oout, Hout, V, targets, nHiddenLayers);
[W, V, dW, dV] = weightupdate(delta_H, delta_O, Hout, momentum, eta, dW, dV, W, V, X);

error(i) = sum(sum(abs(sign(Oout) - targets)./2));
end

x = 1:epochs;
plot(x,error);

end 
