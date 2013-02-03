plotinit;
[xtrain ytrain]=readxy('ballist',2,2);
[xtest ytest]=readxy('balltest',2,2);

data=xtrain;
singlewinner=1;

allUnits = 20:10:80;

errorTrain1 = zeros(1,size(allUnits,2));
errorTrain2 = zeros(1,size(allUnits,2));
errorTest1 = zeros(1,size(allUnits,2));
errorTest2 = zeros(1,size(allUnits,2));

samples = 50;

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

%lowpass filter, broken?
B = fir1(1,0.7);
xtrain = [filter(B,1, xtrain(:,1)), filter(B,1, xtrain(:,2))];
xtest = [filter(B,1, xtest(:,1)), filter(B,1, xtest(:,2))];
ytrain = [filter(B,1, ytrain(:,1)), filter(B,1, ytrain(:,2))];
ytest = [filter(B,1, ytest(:,1)), filter(B,1, ytest(:,2))];



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

plot(allUnits,errorTrain1./samples,allUnits,lowerrorTrain1./samples);
legend('Train 1, Low passed train 1');
xlabel('Units');
ylabel('Error');
figure();
plot(allUnits,errorTrain2./samples,allUnits,lowerrorTrain2./samples);
legend('Train 2, Low passed train 2');
xlabel('Units');
ylabel('Error');
figure();
plot(allUnits,errorTest1./samples,allUnits,lowerrorTest1./samples);
legend('Test 1', 'Low passed test 1');
xlabel('Units');
ylabel('Error');
figure();
plot(allUnits,errorTest2./samples,allUnits,lowerrorTest2./samples);
legend('Test 2', 'Low passed test 2');
xlabel('Units');
ylabel('Error');

warning(warn);
