%%Run one test on diter to test delta rule

fun = @(x) (sin(2*x));
x = 0:0.1:2*pi;
x = x';
    
eta = 1;
units = 35;

makerbf;

%some namming error here :D
%maxiter = 5000;
%itersub = maxiter;

itermax=100000;
itersub=1000;

diter;
xlabel(['Eta = ',num2str(eta,4), '. Units = ',int2str(units),'. iterMax = ',int2str(itermax)])