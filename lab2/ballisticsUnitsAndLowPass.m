plotinit;
[xtrain ytrain]=readxy('ballist',2,2);
[xtest ytest]=readxy('balltest',2,2);

data=xtrain;
singlewinner=1;

allUnits = 20:-1:5;

errorTrain1 = zeros(1,size(allUnits,2));
errorTrain2 = zeros(1,size(allUnits,2));
errorTest1 = zeros(1,size(allUnits,2));
errorTest2 = zeros(1,size(allUnits,2));

samples = 1000;

warn = warning ('off','all');

for it=1:samples,
    j = 1;
    for units=allUnits,
        vqinitNoPlot;
        emiterbNoPlot;
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

        errorTrain1(j)=errorTrain1(j)+sqrt(sum((d1-y1).^2)/length(d1));
        errorTrain2(j)=errorTrain2(j)+sqrt(sum((d2-y2).^2)/length(d1));
        errorTest1(j)=errorTest1(j)+sqrt(sum((dtest1-ytest1).^2)/length(d1));
        errorTest2(j)=errorTest2(j)+sqrt(sum((dtest2-ytest2).^2)/length(d1));
        j = j+1;
    end
    
     if 0==mod(it,10),
       disp('iteration'); 
       disp(int2str(it));
    end
end

[B,A] = butter(4,0.3,'low');% low pass digital filter
xtrain = filter(B,A,xtrain);
xtest = filter(B,A,xtest);
ytrain = filter(B,A,ytrain);
ytest = filter(B,A,ytest);

lowerrorTrain1 = zeros(1,size(allUnits,2));
lowerrorTrain2 = zeros(1,size(allUnits,2));
lowerrorTest1 = zeros(1,size(allUnits,2));
lowerrorTest2 = zeros(1,size(allUnits,2));

data=xtrain;

%Run for lowpassed data
for it=1:samples,
    j = 1;
    for units=allUnits,
        vqinitNoPlot;
        emiterbNoPlot;
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

        lowerrorTrain1(j)=lowerrorTrain1(j)+sqrt(sum((d1-y1).^2)/length(d1));
        lowerrorTrain2(j)=lowerrorTrain2(j)+sqrt(sum((d2-y2).^2)/length(d1));
        lowerrorTest1(j)=lowerrorTest1(j)+sqrt(sum((dtest1-ytest1).^2)/length(d1));
        lowerrorTest2(j)=lowerrorTest2(j)+sqrt(sum((dtest2-ytest2).^2)/length(d1));
        j = j+1;
    end
    
     if 0==mod(it,10),
       disp('iteration'); 
       disp(int2str(it));
    end
end

subplot(2,2,1);
plot(allUnits,errorTrain1./samples,allUnits,lowerrorTrain1./samples);
legend('Train 1', 'Low passed train 1');
xlabel('Units');
ylabel('Error');
subplot(2,2,2);
plot(allUnits,errorTrain2./samples,allUnits,lowerrorTrain2./samples);
legend('Train 2', 'Low passed train 2');
xlabel('Units');
ylabel('Error');
subplot(2,2,3);
plot(allUnits,errorTest1./samples,allUnits,lowerrorTest1./samples);
legend('Test 1', 'Low passed test 1');
xlabel('Units');
ylabel('Error');
subplot(2,2,4);
plot(allUnits,errorTest2./samples,allUnits,lowerrorTest2./samples);
legend('Test 2', 'Low passed test 2');
xlabel('Units');
ylabel('Error');

warning(warn);
