a = [1 3; 4 6];
a * 3;
a*[1;0];
b=inv(a);
round(a*b);
c=-1:0.5:3;
matriz=[1 1+i; 0 i];
palabra = "hola a todos \n";
printf(palabra)
f1=figure('Color', 'white');
scatter([1,2,3,4,5],[1,4,9,16,25]);



theta=linspace(0, 10*pi, 300);
ro = 3 - 5 .* (theta);

% Transformamos a cartesianas
x = ro .* cos(theta);
y = ro .* sin(theta);

% Ploteamos
plot(x,y)
axis equal

%%%%%%
%f2=image
%imshow(f1)
x1= 100*[1];


function F=f(a,b)
  F=a.^2 + b;
  printf("function f\n")
endfunction

function G =g(a,b)
  G=a - f(5,b);
  printf("function g\n")
endfunction

function H = h(a,b)
  return (a(1)*a(2) + b(1)*b(2))
endfunction

%prueba de resolver edif
%function xdot = f (x, t)
%  xdot = zeros(3,1);

%  xdot(1) = 77.27 * (x(2) - x(1)*x(2) + x(1)*x(3) - 8.375e-06* x(1)^2);
%  xdot(2) = (x(3) - x(1)*x(2) - x(2)) / 77.27;
%  xdot(3) = 0.161*(x(1) - x(3));
%endfunction

%x0 = [ 4; 1.1; 4 ];
%t = linspace (0, 500, 1000);
%z = lsode ("f", x0, t);

printf("Todo ok \n")
