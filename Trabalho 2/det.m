syms s x;

% Definindo a matriz dada
A = [2*s^2 + 12000, -8000, 0;
    -8000, 5*s^2 + 14000, -6000;
    0, -6000, s^2 + 6000];

% Substituindo s^2 por x
det_a = det(A)

det_with_x = det(subs(det_a, s^2, x));

% Resolvendo a equação det(A) = 0 para encontrar os valores de x
x_solutions = solve(det(A) == 0, s);

y_solutions = double(solve(det_with_x == 0, x))
