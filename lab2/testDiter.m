%%Run one test on diter to test delta rule

fun = @(x) (sin(2*x));
x = 0:0.1:2*pi;
x = x';
    
eta = .05;
units = 50;

makerbf;

maxiter = 500000;
itersub = maxiter;

diter;
xlabel(['Eta = ',num2str(eta,4), '. Units = ',int2str(units),'. Maxiter = ',int2str(maxiter)])