[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);

X = [patterns; ones(1,ndata)];
T = targets;

ephocs = 100;
eta = 0.001;%0.001;%0.1%1000;%5;%0.5;%0.001;


W = randn(1, insize +1);

%axis([-2, 2, -2, 2], 'square');

for i=1:ephocs,
    deltaW = -eta*(W*X - T)*X';
    W = W + deltaW;
    
    p = W(1,1:2);
    k = -W(1, insize+1)/(p*p');
    l= sqrt(p*p');
    plot(patterns(1,find(targets>0)), ...
    patterns(2,find(targets>0)), '*', ...
    patterns(1,find(targets<0)), ...
    patterns(2,find(targets<0)), '+', ...
    [p(1),p(1)]*k+[-p(2),p(2)]/l,...
    [p(2),p(2)]*k+[p(1),-p(1)]/l,'-')
    %axis([-2, 2, -2, 2], 'square');
    drawnow;
    %pause(0.1);
    %W
end

