% This is to test the steepest descent (gradient) method using Armijo step-size rule.
% It terminates when the norm of the gradient is less than a given small number 'epsilon'(>0).
% The function is defined in the file 'Rosenbrock.m'.
% The gradient is given the file 'Rosenbrock_grad.m'.

clc,
clear,

n=2;          %  the number of variables;
format long


%% User Input

x0 = input("Input column/row vector: ");

% Error handling
if width(x0)==2 && height(x0)==1
    x0 = x0';
elseif width(x0)==1 && height(x0)==1
    fprintf('You have inputted a smaller vector than expected, rerun the program');
    return;
elseif width(x0)>2 || height(x0)>2
    fprintf('You have inputted a larger vector than expected, rerun the program');
    return;
end

set(0,'defaultAxesFontSize', 24);
%set(gcf, 'position', [0, 0, 1920, 1080]);

n=2;          %  the number of variables;

% Armijo stepsize rule parameters
tao  = 0.5; %select tao
epsilon = 1.0e-004; %stopping critereon
beta = 0.4; % select beta

obj = rosenbrock(x0);
g = rosenbrock_grad(x0);


  %% newton-armijo 
  [fcn_out2,x2, A2, Iterate2,obj_func]= newton_armijo(x0, tao, beta, obj, g, epsilon);

  xf2 = [x0';x2];

  figure;
  plot(xf2(:,1),xf2(:,2),'-o'); grid;
  title('x_1, x_2 values During Optimisation');
  xlabel('x_1'),ylabel('x_2'),

  figure;
  plot(Iterate2, A2, '-'); grid;
  title('Changes in \alpha During Optimisation');
  xlabel(["Iterations k: ", height(Iterate2)]),ylabel("Step Size \alpha");
  
  figure;
  plot(Iterate2,obj_func); grid;
  title('Objective function changes with Iterations With Armijo Rule')
  xlabel("Iterations k: "),ylabel("Objective Function Value");
  
 
