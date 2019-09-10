clear all;
clc;

load data;
x = data(:,1);
y = data(:,2);
plot(x, y,'+r');
box off;
title('Beneficios por poblacion');
xlabel('Poblacion (decenas de miles de personas)');
ylabel('Beneficios (decenas de miles de euros)');
hold on;

alpha = 0.01;
m = size(data,1);
X = ones(size(data,1),1);
X = [X x];

iterativeGradientTime = 0;
iterativeCostTime = 0;
matricialCostTime = 0;
matricialGradientTime = 0;


for k = 1:10
  t0 = 0;
  t1 = 0;
  if(k > 5)
    t0 = -1;
    t1 = 2;
  endif
  
  T = [t0;t1];
  tic;
  [j1] = iterativeCost(m,t0,t1,x,y);
  iterativeCostTime += toc;
  tic;
  [j2] = matricialCost(m,T,X,y);
  matricialCostTime += toc;
endfor

t0 = 0;
t1 = 0;
T = [t0;t1];
for k = 1:10
  tic;
  [th0,th1] = iterativeGradient(m,t0,t1,x,y,alpha);
  iterativeGradientTime += toc;
  tic;
  tT = matricialGradient(m,T,X,y,alpha);
  matricialGradientTime += toc;
endfor

# Obtención de los tiempos de ejecución
iterativeCostTime /= 10;
matricialCostTime /= 10;
iterativeGradientTime /= 10;
matricialGradientTime /= 10;

# Actividad 7
Y = tT(1) + tT(2)*x;
plot(x,Y,'b');

# Actividad 8
n = input('Introduce una poblacion(p.e. 35000): ');
cantidadUsuario = tT(1) + tT(2)*(n/10000);
fprintf('La cantidad correspondiente a una poblacion de %d personas es %d euros\n',n,cantidadUsuario*10000);
%plot(n/10000,cantidadUsuario,'ok');
%legend('Datos','Estimacion por regresion lineal','Cantidad introducida','location','southeast');


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
iso = (-10:0.25:10);

figure(2);
surf(valores_theta0,valores_theta1,matrix);
title('Funcion de costo en forma tridimensional');
figure(3);
contour(valores_theta0,valores_theta1,matrix, iso);
axis([-4.5 -3 0.9 1.4]);
hold on;
plot(tT(1),tT(2),'xr');
xlabel('Theta 0');
ylabel('Theta 1');
title('Funcion de costo en forma de contorno');