
ephocs = 400;
eta = 0.001;
x = 1:ephocs;

error = twolayer(patterns,targets,1,ephocs, eta, 0.9);

plot(x, error, 'm')
hold on;

error = twolayer(patterns,targets,2,ephocs, eta, 0.9);
plot(x, error, 'r')
error = twolayer(patterns,targets,5,ephocs, eta, 0.9);
plot(x, error, 'b')
error = twolayer(patterns,targets,10,ephocs, eta, 0.9);
plot(x, error, 'k')

legend('Hidden nodes 1', 'Hidden nodes 2', 'Hidden nodes 5', 'Hidden nodes 10');