% Definir a fun��o que representa a equa��o de movimento de x (n�o homog�nea)
equacao_movimento_x = @(t, x, m, c, k, A, B) [x(2); -c * x(2) - k * x(1) + c * A * cos(B * t) + k * B2 * sin(B * t)];

% Condi��es iniciais nulas para x
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
A = 27 * 5 / m;
B = 27;
B2 = 27 / m;

% Resolver a equa��o de movimento de x com k1 usando ode45
[t_x1, x1] = ode45(@(t, x) equacao_movimento_x(t, x, m, c1, k1, A, B), tspan, y0_x);

% Resolver a equa��o de movimento de x com k2 usando ode45
[t_x2, x2] = ode45(@(t, x) equacao_movimento_x(t, x, m, c2, k2, A, B), tspan, y0_x);

% Criar uma nova figura para os gr�ficos
figure;

% Plotar o gr�fico com k1
subplot(2, 1, 1);
plot(t_x1, x1(:, 1), 'r', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Posi��o (m)');
title('Resposta Temporal de X(t) com k1');
grid on;

% Plotar o gr�fico com k2
subplot(2, 1, 2);
plot(t_x2, x2(:, 1), 'b', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Posi��o (m)');
title('Resposta Temporal de X(t) com k2');
grid on;
