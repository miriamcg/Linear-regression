function C = MporNbruto(M,N)
  #tic;
  [mnr, mnc] = size(M);
  [nnr, nnc] = size(N);
  C = zeros(mnr,nnc);
  
  for i = 1:mnr
    for j = 1:nnc
      for k = 1:nnr
        C(i,j) = C(i,j) + M(i,k).*N(k,j);
       endfor
    endfor
  endfor
  
  #manual = toc;
  endfunction
