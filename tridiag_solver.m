function  [x] = tridiag_solver(e,a,c,b)
% This function that implements the Thomas algorithm to solve tridiagonal
% linear systems of equations.
%
% Input:
%       e = [e1 e2 ... e_{n-1}]
%       a = [a1 a2 ... a_n]e
%       c = [c1 c2 ... c_{n-1}]
%       b = [b1 b2 ... b_n]^T
%
% Output:
%       x = [x1 x2 ... x_n]^T

% Set the tridiagonal matrix
A = diag(a) + diag(c,1) + diag(e,-1);


% Compute LU factorization (no pivoting) of Matrix A
n = size(A,1);

for i=1:n-1   
    % Elimination step 
    for j=(i+1):n
        dd=A(j,i)/A(i,i);
        A(j,i:end)=A(j,i:end) - (A(j,i)/A(i,i))*A(i,i:end);
        A(j,i)=dd;
    end
end

% U and L 
U=triu(A);
L=eye(n)+tril(A,-1);

% Now we solve for x using L and U defined. 
[y] = forward_substitution(L,b);

[x] = backward_substitution(U,y);

end

function [y] = forward_substitution(L,b)
% This function computes the solution to the Lower triangular
% system L*y = b
% 

n=length(b);
y=zeros(n,1);

for i=1:n
    y(i) = b(i);
    for j=1:i-1
        y(i)=y(i)-L(i,j)*y(j);     
    end
    y(i)=y(i)/L(i,i);
end
        
end

function [x] = backward_substitution(U,y)
% This function computes the solution to the upper triangular
% system U*x = y
% 

n=length(y);
x=zeros(n,1);

for i=n:-1:1
    x(i) = y(i);
    for j=(i+1):n
        x(i)=x(i)- U(i,j)*x(j);     
    end
    x(i)=x(i)/U(i,i);
end
        
end
