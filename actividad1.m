clear;
clc;
M = rand(10,30);
N = rand(30,20);
tiempoBruto = 0;
tiempoOctave = 0;
#[R,octaveToc] = MporN(M,N);
#[C,manualToc] = MporNbruto(M,N);

# Si toda la matriz es 0, son iguales
#result = R != C;

Rbruta = zeros(1,4);
Roctave = zeros(1,4);
for j = 2:5
  for i = 1:10
    tic;
    MporN(M,N);
    tiempoOctave += toc;
    tic;
    MporNbruto(M,N);
    tiempoBruto += toc;
  endfor
  Roctave(j-1) = tiempoOctave/10;
  Rbruta(j-1) = tiempoBruto/10;
  M = rand((size(M,1)*j)/2,(size(M,2)*j)/2);
  N = rand((size(N,1)*j)/2,(size(N,2)*j)/2);
endfor

subplot(2,1,1);
plot(Rbruta,'b');
title('Método manual');

subplot(2,1,2);
plot(Roctave,'r');
set (gca, "yticklabel", num2str (get (gca, "ytick"), '%.1e|'));
title("Método de octave");