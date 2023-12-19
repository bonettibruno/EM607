% Definir a função que representa a equação de movimento de x (não homogênea)
% x'' + 4.26 * x' + 507.35 * x = 0
equacao_movimento_x = @(t, x) [x(2); -4.26 * x(2) - 507.35 * x(1)];

% Condições iniciais nulas para x
x0 = 2.5 * pi / (180 * 3); 
x_dot_0 = 10 * pi / (180 * 3);
y0_x = [x0; x_dot_0];

% Intervalo de tempo
tspan = [0 10]; % Intervalo de tempo de 0 a 10 segundos

% Resolver a equação de movimento de x usando ode45
[t_x, x] = ode45(equacao_movimento_x, tspan, y0_x);

% Calcular theta(t) multiplicado por 3
theta = x(:, 1) * 3 * 180 / pi; % Multiplicar por 3

% Criar uma nova figura para os gráficos
figure;

% Criar o primeiro gráfico para a resposta de x(t)
subplot(2, 1, 1); % 2 linhas, 1 coluna, gráfico 1
plot(t_x, x(:, 1), 'r', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Posição (m)');
title('Resposta Temporal de X(t) em Vibração Livre');
grid on;

% Criar o segundo gráfico para a resposta de theta(t)
subplot(2, 1, 2); % 2 linhas, 1 coluna, gráfico 2
plot(t_x, theta, 'b', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Ângulo (graus)');
title('Resposta Temporal de Theta(t) em Vibração Livre');
grid on;
