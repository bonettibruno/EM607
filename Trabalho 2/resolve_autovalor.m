clear;
clc;
%Solicitar a matriz A do usu�rio (pode ser digitada manualmente ou carregada de algum lugar)
A = [0 0 0 1 0 0; 
     0 0 0 0 1 0;
     0 0 0 0 0 1;
     -6000 4000 0 -150 100 0;
     1600 -2800 1200 40 -70 30;
     0 6000 -6000 0 150 -150];


% Calcular o polin�mio caracter�stico
syms lambda; % Definir lambda como uma vari�vel simb�lica
polinomio_caracteristico = det(A - lambda * eye(size(A)));

% Exibir o polin�mio caracter�stico
disp('Polin�mio Caracter�stico:');
disp(polinomio_caracteristico);

% Encontrar as solu��es
solucoes_lambda = vpasolve(polinomio_caracteristico, lambda);

disp('Autovalores por eig:');
disp(eig(A));

% Exibir as solu��es
disp('Solu��es para lambda:');
disp(solucoes_lambda);
