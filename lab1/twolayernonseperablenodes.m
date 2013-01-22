ephocs = 400;
eta = 0.001;
x = 1:ephocs;

error1 = zeros(2,ephocs);
error2 = zeros(2,ephocs);
error3 = zeros(2,ephocs);
error4 = zeros(2,ephocs);
error5 = zeros(2,ephocs);

iter = 1;
hold on;
for i = 1:iter,
error1 = error1 + twolayerSimple(patterns,targets,1,ephocs, eta, 0.9);
error2 = error2 + twolayerSimple(patterns,targets,5,ephocs, eta, 0.9);
error3 = error3 + twolayerSimple(patterns,targets,10,ephocs, eta, 0.9);
error4 = error4 + twolayerSimple(patterns,targets,100,ephocs, eta, 0.9);
error5 = error5 + twolayerSimple(patterns,targets,3000,ephocs, eta, 0.9);
end

error1 = error1./iter;
error2 = error2./iter;
error3 = error3./iter;
error4 = error4./iter;
error5 = error5./iter;

plot(x, error1(1,:), 'm')
hold on;
plot(x, error2(1,:), 'r')
plot(x, error3(1,:), 'b')
plot(x, error4(1,:), 'k')
plot(x, error5(1,:), 'c')
title(['Iterations: ', int2str(iter), '. Learning curve for two layer network with varying number of hidden nodes.'])
legend('Hidden nodes 1', 'Hidden nodes 5', 'Hidden nodes 10', 'Hidden nodes 100', 'Hidden nodes 3000');
xlabel('Epochs'); ylabel('Euclidean error');

figure;
plot(x, error1(2,:), 'm')
hold on;
plot(x, error2(2,:), 'r')
plot(x, error3(2,:), 'b')
plot(x, error4(2,:), 'k')
plot(x, error5(2,:), 'c')
title(['Iterations: ', int2str(iter), '. Learning curve for two layer network with varying number of hidden nodes.'])
legend('Hidden nodes 1', 'Hidden nodes 5', 'Hidden nodes 10', 'Hidden nodes 100', 'Hidden nodes 3000');
xlabel('Epochs'); ylabel('Missclassified instances');