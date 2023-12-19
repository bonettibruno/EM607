% Definir a fun��o que representa a equa��o de movimento de x (n�o homog�nea)
% x'' + 4.26 * x' + 507.35 * x = 10 * sin(15 * t)
equacao_movimento_x = @(t, x) [x(2); -4.26 * x(2) - 507.35 * x(1) + 10 * sin(15 * t)];

% Condi��es iniciais nulas para x
x0 = 0;
x_dot_0 = 0;
y0_x = [x0; x_dot_0];

% Intervalo de tempo
tspan = [0 10]; % Intervalo de tempo de 0 a 10 segundos

% Resolver a equa��o de movimento de x usando ode45
[t_x, x] = ode45(equacao_movimento_x, tspan, y0_x);

% Criar uma nova figura para o gr�fico
figure;

% Criar o segundo gr�fico para a resposta de x(t)
plot(t_x, x(:, 1), 'r', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Posi��o (m)');
title('Resposta Temporal de X(t)');
grid on;
