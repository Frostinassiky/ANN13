
ephocs = 400;
eta = 0.03;
layer = 10;
x = 1:ephocs;

Wstart = randn(10, 3);
Vstart = randn(1, 11);

error = twolayer(patterns,targets,layer,ephocs, eta, 0.99, Wstart, Vstart);

plot(x, error, 'm')
hold on;
error = twolayer(patterns,targets,layer,ephocs, eta, 0.7, Wstart, Vstart);
plot(x, error, 'c')
error = twolayer(patterns,targets,layer,ephocs, eta, 0.0001, Wstart, Vstart);
plot(x, error, 'k')

%legend('Momentum 1.0', 'Momentum 0.7', 'Momentum 0.5', 'Momentum 0.3', 'Momentum 0.2', 'Momentum 0');
legend('Momentum 0.99', 'Momentum 0.7', 'Momentum 0.0001');