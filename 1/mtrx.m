function calcs = mtrx(A)

%MTRX   several matrix norms
%
% MTRX(A) computes for a given matrix: the main diagonal element sum, the
% element sum and product of every row and column and the matrix inverse.
%
%   INPUT:      A       -> input matrix, must be 1D or 2D
%   OUTPUT:     calcs   -> a 1x6 cell array containing:
%
%                       [   element sum of main diagonal,                
%                           element sum of every row,
%                           element sum of every column,
%                           element product of every row,
%                           element product of every column,
%                           matrix inverse                      ]
%
%   code:  Nikos Saridakis
%   date:  2020-04-12

clc

%% input checks

disp(' ')
disp('INPUT CHECKS')
disp(' ')

if ~(ismatrix(A)) % check if input is no matrix
  
    disp('-> input: no matrix')
    mat = false;
    
else
    
    disp('-> input: matrix')
    mat = true;
    
    if ~(isnumeric(A))
        
        disp('-> input: no numeric')
        num = false;
        
    else
        
        disp('-> input: numeric')
        num = true;
        
        if (isempty(A))
        
            disp('-> input: empty')
            emp = true;
    
        else
        
            disp('-> input: no empty')
            emp = false;
        
            if (isscalar(A))
                    
                disp('-> input: scalar')
                sca = true;
                vec = true;
                squ = true;
                    
            else
                    
                disp('-> input: no scalar')
                sca = false;
    
                if (isvector(A)) % check if input is vector
    
                    disp('-> input: vector')
                    vec = true;
        
                else
    
                    disp('-> input: no vector')
                    vec = false;
        
                    if (diff(size(A))) % check if input is no square
        
                        disp('-> input: no square')
                        squ = false;
    
                    else
        
                        disp('-> input: square')
                        squ = true;
              
                    end
                
                end

            end
        
        end
        
    end
    
end

%% computations

disp(' ')
disp('COMPUTATIONS')
disp(' ')

if ~(mat && num && ~emp) 

    sumDiag     = [];
    sumRows     = [];
    sumCols     = [];
    prodRows    = [];
    prodCols    = [];
    inverse     = [];
    
%     disp(' SUM [diag]   =>    NON APPLICABLE')
%     disp(' SUM [rows]   =>    NON APPLICABLE')
%     disp(' SUM [cols]   =>    NON APPLICABLE')
%     disp('PROD [rows]   =>    NON APPLICABLE')
%     disp('PROD [cols]   =>    NON APPLICABLE')
%     disp('    INVERSE   =>    NON APPLICABLE')
    
else
    
    if (sca)
        
        sumDiag     = A;
        sumRows     = A;
        sumCols     = A;
        prodRows    = A;
        prodCols    = A;
        inverse     = A;
        
    else
        
       if (vec)
           
           sumDiag     = A(1,1);    % display element [1,1]
           sumRows     = sum(A,2);  % compute the sum of vector
           sumCols     = sum(A,1);  % display every element
           prodRows    = prod(A,2); % compute the product of vector
           prodCols    = prod(A,1); % display every element
           inverse     = [];
           
       else
           
           if ~(squ)
               
                sumDiag     = sum(diag(A)); 
                sumRows     = sum(A,2);  % compute the sum of each row
                sumCols     = sum(A,1);  % compute the sum of each column
                prodRows    = prod(A,2); % compute the prod of each row
                prodCols    = prod(A,1); % compute the prod of each column
                inverse     = [];
                
           else
               
                sumDiag     = trace(A);  % compute the trace
                sumRows     = sum(A,2);  % compute the sum of every row
                sumCols     = sum(A,1);  % compute the sum of every column
                prodRows    = prod(A,2); % compute the prod of every row
                prodCols    = prod(A,1); % compute the prod of every column
                inverse     = inv(A);    % compute the inverse
                
           end
           
       end
        
    end
    
    if ~(squ)
        
        disp('-> main diagonal element sum:')
        disp(' ')
        disp(sumDiag)
        
    else
        
        disp('-> trace:')
        disp(' ')
        disp(sumDiag)
        
    end
    
    disp(' ')
    
    disp('-> every row element sum:')
    disp(' ')
    disp(sumRows)
    
    disp(' ')
    
    disp('-> every column element sum:')
    disp(' ')
    disp(sumCols)
    
    disp(' ')
    
    disp('-> every row element product:')
    disp(' ')
    disp(prodRows)
    
    disp(' ')
    
    disp('-> every column element product:')
    disp(' ')
    disp(prodCols)
    
    disp(' ')
    
    if ~(isempty(inverse))
        
        disp('-> inverse:')
        disp(' ')
        disp(inverse)
        
    else
        
        disp('-> non invertable')
        
    end
    
end

%% output prep

calcs = { sumDiag sumRows sumCols prodRows prodCols inverse };