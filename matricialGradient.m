function [T] = matricialGradient(m,T,X,y,alpha)
  for j = 1:1500
    T = T - (alpha/m).*(X'*((X*T)-y));
  endfor
endfunction
