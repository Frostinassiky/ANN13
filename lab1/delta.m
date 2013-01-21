sepdata
[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);

X = [patterns; ones(1,ndata)];
T = targets;

ephocs = 200;
eta = 0.01;

W = randn(1, insize +1);
%when we don't solve it but converge we're moving in the wrong direction
%different sources say different things about the delta rule. Some say it
%allways find a solution, some say it doesn't
%(says it doesn't allways get a 0 error, same as not finding a solution?)
%www.csee.umbc.edu/~ypeng/NNCourse/NN-Ch2.ppt

%(says it allways finds a solution)
%http://www.cs.elte.hu/~rfuller/nfs10.pdf
%http://www.cs.stir.ac.uk/courses/ITNP4B/lectures/kms/3-DeltaRule.pdf
%Select a size for the axis so that we can see all the data points
s = 1.1*max([max(patterns(1,:)) max(patterns(2,:)) -min(patterns(1,:)) -min(patterns(2,:))]);
axis([-s, s, -s, s], 'square');

for i=1:ephocs,
    %The values in W*X can at most/least be 1/-1.
    %This seems to work better and it seems like it solves all linearly
    %seperable problems now.
    b = W*X;
    Y = (b>1)-(b<-1)+b.*(b>=-1 & b<=1);
    %Y =W*X;
    deltaW = eta*(T-Y)*X';
    W = W + deltaW;
    
    p = W(1,1:2);
    k = -W(1, insize+1)/(p*p');
    l= sqrt(p*p');
    x = [p(1),p(1)]*k+sqrt(2)*s*[-p(2),p(2)]/l;
    y = [p(2),p(2)]*k+sqrt(2)*s*[p(1),-p(1)]/l;
    
    plot(patterns(1,find(targets>0)), ...
    patterns(2,find(targets>0)), '*', ...
    patterns(1,find(targets<0)), ...
    patterns(2,find(targets<0)), '+', ...
    x,...
    y,'-');
    
    axis([-s, s, -s, s], 'square');
    title(['ephocs: ' int2str(i) ', eta: ' num2str(eta,4)])
    drawnow;
end
