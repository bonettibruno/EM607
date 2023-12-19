% Frequência angular natural
omega_n = 22.52; % rad/s

% Definir a função que representa a equação de movimento de x (não homogênea)
% x'' + 0 * x' + 507.35 * x = 10 * sin(omega_n * t)
equacao_movimento_x = @(t, x) [x(2); 0 * x(2) - 507.35 * x(1) + 10 * sin(omega_n * t)];

% Condições iniciais nulas para x
x0 = 0;
x_dot_0 = 0;
y0_x = [x0; x_dot_0];

% Intervalo de tempo
tspan = [0 10]; % Intervalo de tempo de 0 a 10 segundos

% Resolver a equação de movimento de x usando ode45
[t_x, x] = ode45(equacao_movimento_x, tspan, y0_x);

% Calcular theta(t) multiplicado por 3
theta = x(:, 1) * 3 * 180 / pi; 

% Criar uma nova figura para os gráficos
figure;

% Criar o primeiro gráfico para a resposta de x(t)
subplot(2, 1, 1); % 2 linhas, 1 coluna, gráfico 1
plot(t_x, x(:, 1), 'r', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Posição (m)');
title('Resposta Temporal de X(t) na Frequência de Ressonância e c = 0');
grid on;

% Criar o segundo gráfico para a resposta de theta(t)
subplot(2, 1, 2); % 2 linhas, 1 coluna, gráfico 2
plot(t_x, theta, 'b', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Ângulo (graus)');
title('Resposta Temporal de Theta(t) na Frequência de Ressonância e c = 0');
grid on;
