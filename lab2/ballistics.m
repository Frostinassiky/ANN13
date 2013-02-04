plotinit;
[xtrain ytrain]=readxy('ballist',2,2);
[xtest ytest]=readxy('balltest',2,2);

%lowpass filter

xtraincopy = xtrain;
ytraincopy = ytrain;
[B,A] = butter(4,0.5,'low');	% low pass digital filter
xtrain = filter(B,A,xtrain);
xtest = filter(B,A,xtest);
ytrain = filter(B,A,ytrain);
ytest = filter(B,A,ytest);

%B = fir1(4,0.5);
%xtrain = [filter(B,1, xtrain(:,1)), filter(B,1, xtrain(:,2))];
%xtest = [filter(B,1, xtest(:,1)), filter(B,1, xtest(:,2))];
%ytrain = [filter(B,1, ytrain(:,1)), filter(B,1, ytrain(:,2))];
%ytest = [filter(B,1, ytest(:,1)), filter(B,1, ytest(:,2))];

units=20;
data=xtrain;
vqinit;
singlewinner=1;
emiterb

Phi=calcPhi(xtrain,m,var);

d1=ytrain(:,1);
d2=ytrain(:,2);
dtest1=ytest(:,1);
dtest2=ytest(:,2);

w1=Phi\d1;
w2=Phi\d2;
y1=Phi*w1;
y2=Phi*w2;

Phitest=calcPhi(xtest,m,var);
ytest1=Phitest*w1;
ytest2=Phitest*w2;

yVal = 2;
xVal = 2;
k = 1;

subplot(yVal,xVal,k), xyplot(d1,y1,'train1'), k = k+1;
subplot(yVal,xVal,k), xyplot(d2,y2,'train2'), k = k+1;
subplot(yVal,xVal,k), xyplot(dtest1,ytest1,'test1'), k = k+1;
subplot(yVal,xVal,k), xyplot(dtest2,ytest2,'test2');

figure;
subplot(1,2,1), plot(xtraincopy,ytraincopy,'*');
legend('Data1','Data2');
subplot(1,2,2), plot(xtrain,ytrain,'*');
legend('Data1','Data2');