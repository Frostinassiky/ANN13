[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);

X = [patterns; ones(1,ndata)];
T = targets;

ephocs = 20;
eta = 0.001;


W = randn(1, insize +1);
%Select a size for the axis so that we can see all the data points
s = 1.1*max([max(patterns(1,:)) max(patterns(2,:)) -min(patterns(1,:)) -min(patterns(2,:))]);
axis([-s, s, -s, s], 'square');

for i=1:ephocs,
    deltaW = -eta*(W*X - T)*X';
    W = W + deltaW;
    
    p = W(1,1:2);
    k = -W(1, insize+1)/(p*p');
    l= sqrt(p*p');
    %W2D = [W(1) W(2)];
    %W
    %W2D = W2D./norm(W2D);
    x = [p(1),p(1)]*k+sqrt(2)*s*[-p(2),p(2)]/l;
    y = [p(2),p(2)]*k+sqrt(2)*s*[p(1),-p(1)]/l;
    
    plot(patterns(1,find(targets>0)), ...
    patterns(2,find(targets>0)), '*', ...
    patterns(1,find(targets<0)), ...
    patterns(2,find(targets<0)), '+', ...
    x,...
    y,'-');
    %[0 W2D(1)] + sum(x)/2, [0 W2D(2)] + sum(y)/2);
    axis([-s, s, -s, s], 'square');
    title(['ephocs: ' int2str(i) ', eta: ' num2str(eta,4)])
    drawnow;
end

