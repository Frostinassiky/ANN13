%%Run one test on diter to test delta rule

fun = @(x) (sin(2*x));
x = 0:0.1:2*pi;
x = x';
    
eta = 0.01;
units = 25;

makerbf;

itermax = 500000;
itersub = itermax;

diter;
xlabel(['Eta = ',num2str(eta,4), '. Units = ',int2str(units),'. itermax = ',int2str(itermax)])