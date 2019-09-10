

# Actividad 7
Y = tT(1) + tT(2)*x;
plot(x,Y,'b');

# Actividad 8
n = input('Introduce una poblacion(p.e. 35000): ');
cantidadUsuario = tT(1) + tT(2)*(n/10000);
fprintf('La cantidad correspondiente a una poblacion de %d personas es %d euros\n',n,cantidadUsuario*10000);
plot(n/10000,cantidadUsuario,'ok');
legend('Datos','Estimacion por regresion lineal','Cantidad introducida','location','southeast');

# Actividad 9
valores_theta0 = linspace(-10,10,100);
valores_theta1 = linspace(-1,4,100);
valores_J = zeros(100,100);

for i = 1:100
  for j = 1:100
    valores_Tt = [valores_theta0(i);valores_theta1(j)];
    valores_J(i,j) = matricialCost(m,valores_Tt,X,y);
  endfor
endfor

matrix = valores_J';

figure(2);
surf(valores_theta0,valores_theta1,matrix);
title('Funcion de costo en forma tridimensional');

figure(3);
contour(valores_theta0,valores_theta1,matrix);
axis([-5 5 -10 10]);
title('Funcion de costo en forma de contorno');
