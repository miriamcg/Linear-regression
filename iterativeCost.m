function [j] = iterativeCost(m,t0,t1,x,y)
  j = 0;
    for i = 1:m;
      j = j + ((t0 + t1.*x(i)) - y(i)).^2;
    endfor
    j = j/(2*m);
endfunction