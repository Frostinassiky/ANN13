x=[-5:1:5]';
y=x;
%theta = 0:0.01:2*pi;
%r = 0:0.1:5;

%for r=0:0.1:5,
   % for theta = 0:0.01:2*pi,
  %      targets
 %   end
%end

%x = r * cos(theta);
%y = r * sin(theta);


z=exp(-x.*x*0.1) * exp(-y.*y*0.1)' - 0.5;

epochs = 1000;
nHiddenLayers = 50;
targets = reshape (z, 1, size(z,1)*size(z,2));
[xx, yy] = meshgrid (x, y);
patterns = [reshape(xx, 1, size(xx,1)*size(xx,2)); reshape(yy, 1, size(yy,1)*size(yy,2))];

%Generalization test
permute = randperm(2*ndata);
patterns= patterns(:,permute);
targets = targets(:,permute);
nPoints = size(targets,2)*0.5;
%%%%%


[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);
X = [patterns ; ones(1,ndata)];
W = randn(nHiddenLayers, insize + 1); %hmm, size correct? size and bias
V = randn(outsize, nHiddenLayers + 1); %hmm, size correct? Add one for bias?
dW = zeros(size(W,1),size(W,2));
dV = zeros(size(V,1),size(V,2));

error = zeros(1,epochs);
eta=0.1;
momentum=0.9;

for i=1:epochs,
[Oout, Hout] = forwardpass(X, W, V);
[delta_H, delta_O] = backwardpass(Oout, Hout, V, targets, nHiddenLayers);
[W, V, dW, dV] = weightupdate(delta_H, delta_O, Hout, momentum, eta, dW, dV, W, V, X);

    zz = reshape(Oout, sqrt(ndata), sqrt(ndata));
    mesh(x,y,zz-z);
    axis([-5 5 -5 5 -0.7 0.7]);
    drawnow;
end
