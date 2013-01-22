function errors = twolayerSimple( patterns, targets, nHiddenLayers, epochs, eta,momentum)

[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);
W = randn(nHiddenLayers, insize + 1); %hmm, size correct? size and bias
V = randn(outsize, nHiddenLayers + 1); %hmm, size correct? Add one for bias?

errors = twolayer( patterns, targets, nHiddenLayers, epochs, eta,momentum, W, V);

end