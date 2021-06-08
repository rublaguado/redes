% Atrayente de Lorentz
clear

a = 10;
b = 28;
c = 8/3;
  
f = @(t, x) [ -a*x(1) + a*x(2); 
  b*x(1) - x(2) - x(1)*x(3); 
  -c*x(3) + x(1)*x(2)];

x0=[1 1 1];
[t, x] = ode45(f, [0 200], x0);
figure 
plot3(x(:,1),x(:,2),x(:,3));