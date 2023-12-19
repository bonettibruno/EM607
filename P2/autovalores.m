% Defina os símbolos
syms J kt lambda;

% Defina as matrizes M e K
M = [J, 0; 0, 2*J];
K = [3*kt, -2*kt; -2*kt, 2*kt];

% Calcule a matriz característica
B = inv(M)

A = inv(M) * K;

% Defina a matriz lambda * I
lambdaI = lambda * eye(2);

% Calcule a matriz característica M^{-1}K - lambda * I
eq_caracteristica = det(A - lambdaI);

% Exiba a equação característica
disp('Equação Característica:');
disp(eq_caracteristica);
