function result = rhoderivative( x )

%result = (1 + rho(x))*(1-rho(x))/2;
result = ((1 + rho(x)) .* (1 - rho(x))) * 0.5;
%result = ((1 + x) .* (1 - x)) * 0.5;

end

