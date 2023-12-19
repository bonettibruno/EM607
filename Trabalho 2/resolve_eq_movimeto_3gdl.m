% Limpar a janela de comando e as variáveis
clc;
clear;

% Defina as matrizes de massa, amortecimento e rigidez
M = [2 0 0; 0 5 0; 0 0 1];  % Matriz de massa
C = [300 -200 0; -200 350 -150; 0 -150 150];  % Matriz de amortecimento
K = [12000 -8000 0; -8000 14000 -6000; 0 -6000 6000];  % Matriz de rigidez

% Calcule os autovalores e autovetores
[modos, frequencias] = eig(K, M);

% Extraia as frequências naturais e os modos de vibrar
frequencias_naturais = sqrt(diag(frequencias));

% Calcule os fatores de amortecimento corretamente
fatores_amortecimento = -real(diag(frequencias)) ./ abs(diag(frequencias));

% Exiba os resultados
disp('Frequências Naturais:');
disp(frequencias_naturais);
 

disp('Fatores de Amortecimento:');
disp(fatores_amortecimento);

disp('Modos de Vibrar:');
disp(modos);

disp(-inv(M)*K);