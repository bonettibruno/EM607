clc;
close all;
clear all;

% Definir a função que representa o sistema de equações de movimento acopladas
M = [2 0 0; 0 5 0; 0 0 1];
C = [300 -200 0; -200 350 -150; 0 -150 150];
K = [12000 -8000 0; -8000 14000 -6000; 0 -6000 6000];

equacao_movimento = @(t, x) [
    x(4);
    x(5);
    x(6);
    -M \ (C * x(4:6) + K * x(1:3))
];

% Condições iniciais
x1_0 = 10 * 10^-3;
x2_0 = 5 * 10^-3;
x3_0 = 5 * 10^-3;
x1_dot_0 = 0;
x2_dot_0 = 1;
x3_dot_0 = 0;

y0 = [x1_0; x2_0; x3_0; x1_dot_0; x2_dot_0; x3_dot_0];

% Intervalo de tempo
tspan = [0 10];

% Resolver as equações de movimento acopladas usando ode45
[t, x] = ode45(equacao_movimento, tspan, y0);

% Criar uma nova figura para o gráfico
figure;

% Gráfico da posição x1(t)
subplot(3, 1, 1);
plot(t, x(:, 1), 'r', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('x1 (m)');
title('Resposta Temporal de x1(t)');
grid on;

% Gráfico da posição x2(t)
subplot(3, 1, 2);
plot(t, x(:, 2), 'b', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('x2 (m)');
title('Resposta Temporal de x2(t)');
grid on;

% Gráfico da posição x3(t)
subplot(3, 1, 3);
plot(t, x(:, 3), 'g', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('x3 (m)');
title('Resposta Temporal de x3(t)');
grid on;
