% Ejercicio 24
% Modelo FitzHugh-Naguno FN
clear 

I = 0;
a = 2;
b = 0.3;
phi = -3;

% X = (V,U) será la solución al sistema de ecuaciones
f = @(t, X) [X(1) - X(1)^3/3 - X(2) + I; 
  phi*X(1) +phi*a - phi*b*X(2)];
  
[t, X] = ode45(f, [0 200], [1 2]);
figure 
plot(X(:,1),X(:,2));