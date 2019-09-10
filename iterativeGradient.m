function [t0,t1] = iterativeGradient(m,t0,t1,x,y,alpha)
  for j = 1:1500
    suma0 = 0;
    suma1 = 0;
    for k = 1:m
      suma0 = suma0 + t0 + t1*x(k) - y(k);
      suma1 = suma1 + x(k)*(t0 + t1*x(k) - y(k));
    endfor
    t0 = t0 - (alpha/m)*suma0;
    t1 = t1 - (alpha/m)*suma1;
  endfor
endfunction
