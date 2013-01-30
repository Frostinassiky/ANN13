%Comment the plots in diter for faster runs and not overwritting the
%figures
%run multiple runs on diter to see eta, units and iterationis impact on
%error.
samples = 20; %makerbf intisalise weight matrix randomly, iterate to get better result
fun = @(x) (sin(2*x));
x = 0:0.1:2*pi;
x = x';

%Etas    
etas = 0.01:0.01:1;%[0.001, 0.005, 0.01, 0.05, 0.1,0.5, 1];
errors = zeros(1,size(etas,2));
units = 6;

for j=1:samples,
    i = 1;
    for eta=etas,
        makerbf;
        diter;
        errors(i) = errors(i) + max(abs(f-y)); %maxError
        i = i+1;
    end
end

errors = errors./samples;
plot(etas, errors);
xlabel('Etas');
ylabel('Error');

%%Units
allUnits = 6:1:20;
errorsU = zeros(1,size(allUnits,2));

for j=1:samples,
    i = 1;
    for units=allUnits,
        makerbf;
        diter;
        errorsU(i) = errorsU(i) + max(abs(f-y)); %maxError
        i = i+1;
    end
end

errorsU = errorsU./samples;
figure;
plot(allUnits, errorsU);
xlabel('Units');
ylabel('Error');

%%Iterations
allIterations = 100:100:4000;
errorsI = zeros(1,size(allIterations,2));
units = 6;

for j=1:samples,
    i = 1;
    for myItermax=allIterations,
        makerbf;
        itersub = myItermax;
        itermax = myItermax;
        diter;
        errorsI(i) = errorsI(i) + max(abs(f-y)); %maxError
        i = i+1;
    end
end

errorsI = errorsI./samples;
figure;
plot(allIterations, errorsI);
xlabel('Iterations');
ylabel('Error');