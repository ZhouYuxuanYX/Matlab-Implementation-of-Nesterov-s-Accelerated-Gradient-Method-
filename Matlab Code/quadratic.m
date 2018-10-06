function [Problem] = quadratic(A, b)
% This file defines quadratic problem
%
% Inputs:
%           A       a positive definite matrix of size dxd
%           b       a column vector of size d
%
% Output:
%       Problem     problem instance. 
%
%
% The problem of interest is defined as
%
%           min f(x) = 1/2 * x^T * A * x - b^T * x.
%           where 
%           x in R^d
%
% "w" is the model parameter of size d vector.
    d = length(b);
    n = d;
    
    Problem.name = @() 'quadratic';    
    Problem.dim = @() d;
    Problem.samples = @() n;    
    Problem.A = @() A;     
    Problem.b = @() b;  
    
    Problem.cost = @cost;
    function f = cost(x)

        f = 1/2 * x' * A * x - b' * x;
    end

    Problem.grad = @grad;
    function g = grad(x)
        
        g = (x'*(A+A') - b')';
        
    end  

end