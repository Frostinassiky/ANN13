function [delta_H, delta_O] = backwardpass( Oout, Hout, V, targets, nHiddenLayers)

hidden = nHiddenLayers;




delta_O = (Oout - targets) .* rhoderivative(Oout);%((1 + Oout) .* (1 - Oout)) * 0.5; %rhoderivative(Oout), the last multiplication
delta_H = (V' * delta_O) .* rhoderivative(Hout);%((1 + Hout) .* (1 - Hout)) * 0.5; %rhoderivative(Hout)
delta_H = delta_H(1:hidden, :); %Remove bias term?

end

