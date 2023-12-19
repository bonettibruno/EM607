%Matriz A

% Dados da matriz de massa, rigidez e amortecimento
M = [2 0 0; 0 5 0; 0 0 1];
C = [300 -200 0; -200 350 -150; 0 -150 150];
K = [12000 -8000 0; -8000 14000 -6000; 0 -6000 6000];

% Calcular a inversa da matriz de massa
Minv = inv(M);

% Construir a matriz A
A = [zeros(3) eye(3); -Minv * K -Minv * C];

syms s;


C = M*s^2 + C*s + K


x_solutions = solve(det(C) == 0, s);

double(x_solutions)


% % Exibir a matriz A
% disp('Matriz A:');
% disp(A);
