%Surface plot

x = -5:0.1:5;
y = x;
z = exp(-(x^2)/2)

surf(theta0_vals, theta1_vals, J_vals)
