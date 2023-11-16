function [fcn,Solution, A, Iterate,obj_func]= newton_armijo(x,tao,beta,obj,g, epsilon)
% file name:  newton_armijo.m
% This is for the steepest descent (gradient) method using the Armijo step-size rule.
% It terminates when the norm of the gradient is less than a given small number 'epsilon'(>0).
% The function is defined in the file 'Rosenbrock.m'.
% The gradient is given the file 'Rosenbrock_grad.m'.
  a=1;
  k=1;          % the index of iterations (search steps)

  obj_func=[];

%% Iteration procedure
  while  norm(g) >= epsilon
      fcn(k) = rosenbrock(x);
      d = -inv(rosenbrock_hessian1(x))*rosenbrock_grad(x); %Newtons Direction
      a = 1;
      newobj = rosenbrock(x + a*d);

%% Armijo Rule (Comment out if Armijo Rule not needed)
         while newobj-(obj + a * beta .* g'*d)>0
                a = a*tao;  
                newobj = rosenbrock(x + a*d);
         end
%%          
         x = x + a*d;
         obj = newobj;
         g =   rosenbrock_grad(x);
        
         obj_func=[obj_func;newobj];

         A(k) = a;
         Solution(k,:)= x;
         Iterate(k) = k;
         k = k + 1;

         fprintf('Number of iteration is: %10u\n',k);
         fprintf('Value of alpha is: %u\n  ',a);
         fprintf('Function Value f(x1, x2)= %u\n', rosenbrock(x));
  end
      
% Iteration end  
A = A';
Iterate = Iterate';
x, k    % Display x and k