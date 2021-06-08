% atrayente de Rössler
clear

a = 0.2;
b = 0.2;
c = 5.7;
  
f = @(t, x) [ -x(2) - x(3); 
  x(1) + a*x(2); 
  b + x(1)*x(3) - c*x(3)];

x0=[1 1 1];
[t, x] = ode45(f, [0 200], x0);
figure 
plot3(x(:,1),x(:,2),x(:,3));
