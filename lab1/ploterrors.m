
ephocs = 40;
layers = 5;
x = 1:ephocs;

error = twolayer(patterns,targets,layers,ephocs, 1, 0.9);

plot(x, error, 'm')
hold on;

error = twolayer(patterns,targets,layers,ephocs, 0.1, 0.9);
plot(x, error, 'r')
error = twolayer(patterns,targets,layers,ephocs, 0.01, 0.9);
plot(x, error, 'b')
error = twolayer(patterns,targets,layers,ephocs, 0.001, 0.9);
plot(x, error, 'k')

legend('Eta 1', 'Eta 0.1', 'Eta 0.01', 'Eta 0.001');