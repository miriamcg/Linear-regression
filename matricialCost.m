function [j] = matricialCost(m,T,X,y)
    j = sum(((X*T)-y).^2)/(2*m);
endfunction
