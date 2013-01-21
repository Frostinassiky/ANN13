function [ W, V, dW, dV ] = weightupdate( delta_H, delta_O, Hout, momentum, eta, dW, dV , W, V, X)

%dW and dW are the previous weight changes, but what to initialize them to
%at the start? 0 vector?

alpha = momentum;


dW = (dW .* alpha) - (delta_H * X') .* (1-alpha);
dV = (dV .* alpha) - (delta_O * Hout') .* (1-alpha);
W = W + dW .* eta;
V = V + dV .* eta;


end

