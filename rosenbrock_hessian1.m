function y = rosenbrock_hessian(vars)

y = [0 0; 0 0];

y(1) = 800*vars(1)^2 - 400*(vars(2) - vars(1)^2) +2 ;
y(2) = -400*vars(1);
y(3) = -400*vars(1);
y(4) = 200;

end