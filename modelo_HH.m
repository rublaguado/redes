% ejercicio 22
% modelo Hodgkin-Huxley del axon gigante del calamar
clear
t = linspace(50, 100, 100);
V = linspace(-120, 40, 100);
I = 10; 

% constantes, potenciales del Sodio, Potasio y potencial difusivo
g_l = 0.3;
g_k = 36;
g_na = 120;
Vl = -54.402;
Vk = -77;
Vna = 50;

% estimación de las variables m,n,h (dependientes del tiempo) 
% aproximándolas a los valores m_inf(V), n_inf(V), h_inf(V) con edif
% funcion auxiliar alpha 
function alph= Alpha(m_n_h, V)
  if m_n_h=="m"
    alph= 0.1*(V+40)./(1-exp(-0.1*(V+40)));
  elseif m_n_h == "n"
    alph= 0.01*(V+55)./(1-exp(-0.1*(V+55)));
  elseif m_n_h == "h"
    alph= 0.07* exp(-0.05*(V+65));
  else 
    printf("valid input are the strings m, n or h\n and the integer V")
  endif
endfunction
%funcion auxiliar beta 
function bet= Beta(m_n_h, V)
  if m_n_h == "m"
    bet =4*exp(-0.0556*(V+65));
  elseif m_n_h == "n"
    bet =0.125*exp(-0.0125*(V+65));
  elseif m_n_h == "h"
    bet =1./(1+exp(-0.1*(V+35)));
  else 
    printf("valid input are the strings m, n or h\n and the integer V")
  endif
endfunction  
%funcion auxiliar tau. m_n_h es un string
function tau=Tau(m_n_h, V)
  tau=1./(Alpha(m_n_h,V)+ Beta(m_n_h,V));
endfunction
%Variables m_inf, n_inf, h_inf (V)
function M_inf = m_inf(V)
  M_inf = Alpha("m", V)./(Alpha("m",V)+Beta("m",V));
endfunction
function N_inf= n_inf(V)
  N_inf = Alpha("n", V)./(Alpha("n",V)+Beta("n",V));
endfunction
function H_inf = h_inf(V)
  H_inf = Alpha("h", V)./(Alpha("h",V)+Beta("h",V));
endfunction
%
figure
hold on 
plot(V,Tau("m",V))
plot(V,Tau("n",V))
plot(V,Tau("h",V))
hold off
figure
hold on
plot(V,m_inf(V))
plot(V,n_inf(V))
plot(V,h_inf(V))
hold off


% Aproximar los valores m,n,h (que dependen de V y del tiempo) 
% a los valores m_inf, n_inf,h_inf (que dependen solo de V)
% Con estas EDOs (x_0 =0)
function dm(m,t)
  V=3;
  (m_inf(V)-m)/Tau("m",V);
endfunction
m0 = [0];
  

%Función de las corrientes iónicas. Depende de V, m, n, h
% donde V es el potencial 
function Fe = F(V,m,n,h)
  g_l = 0.3;
  g_k = 36;
  g_na = 120;
  Vl = -54.402;
  Vk = -77;
  Vna = 50;
  Fe= g_l*(V-Vl) .+ g_k*(n.^(4)).*(V-Vk) .+ g_na*h.*(m.^(3)).*(V-Vna);
endfunction

%
%Función diferencial de V respecto de I (y de F(V))

diffV = @(t, V) I - F(V, m_inf(V), n_inf(V), h_inf(V));

[t, V] = ode45(diffV, [0 200], 0);
figure
plot(V, F(V,m_inf(V),n_inf(V),h_inf(V)))
figure
plot(t,V)

