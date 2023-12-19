clear;
clc;
%Solicitar a matriz A do usuário (pode ser digitada manualmente ou carregada de algum lugar)
A = [0 0 0 1 0 0; 
     0 0 0 0 1 0;
     0 0 0 0 0 1;
     -6000 4000 0 -150 100 0;
     1600 -2800 1200 40 -70 30;
     0 6000 -6000 0 150 -150];


% Calcular o polinômio característico
syms lambda; % Definir lambda como uma variável simbólica
polinomio_caracteristico = det(A - lambda * eye(size(A)));

% Exibir o polinômio característico
disp('Polinômio Característico:');
disp(polinomio_caracteristico);

% Encontrar as soluções
solucoes_lambda = vpasolve(polinomio_caracteristico, lambda);

disp('Autovalores por eig:');
disp(eig(A));

% Exibir as soluções
disp('Soluções para lambda:');
disp(solucoes_lambda);
