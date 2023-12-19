% Definir a função que representa a equação de movimento de x (não homogênea)
equacao_movimento_x = @(t, x, m, c, k, A, fase, omega) [x(2); -c * x(2) - k * x(1) + A * sin(omega * t + fase)];

% Condições iniciais nulas para x
x0 = 0;
x_dot_0 = 0;
y0_x = [x0; x_dot_0];

% Intervalo de tempo
tspan = [0 10]; % Intervalo de tempo de 0 a 10 segundos

% Constantes
m = 6;
c1 = 25.57 / m;
k1 = 3044.145 / m;
c2 = 25.57 / m;
k2 = 874.24 / m;
A = 0.005 * sqrt(c1^2 + k1^2) / m; % Amplitude para k1
fase = atan(k1 / c1); % Fase para k1
omega = 27;

% Resolver a equação de movimento de x com k1 usando ode45
[t_x1, x1] = ode45(@(t, x) equacao_movimento_x(t, x, m, c1, k1, A, fase, omega), tspan, y0_x);

% Constantes para k2
A = 0.005 * sqrt(c2^2 + k2^2) / m; % Amplitude para k2
fase = atan(k2 / c2); % Fase para k2

% Resolver a equação de movimento de x com k2 usando ode45
[t_x2, x2] = ode45(@(t, x) equacao_movimento_x(t, x, m, c2, k2, A, fase, omega), tspan, y0_x);

% Criar uma nova figura para os gráficos
figure;

% Plotar o gráfico com k1
subplot(2, 1, 1);
plot(t_x1, x1(:, 1), 'r', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Posição (m)');
title('Resposta Temporal de X(t) com k = 3044.145 N/m');
grid on;

% Plotar o gráfico com k2
subplot(2, 1, 2);
plot(t_x2, x2(:, 1), 'b', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Posição (m)');
title('Resposta Temporal de X(t) com k = 874.24 N/m');
grid on;
