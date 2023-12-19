clc;
close all;
clear all;

% Definir a função que representa o sistema de equações de movimento acopladas
M = [1, 0; 0, 2];
C = [2, 0; 0, 0];
K = [200, -100; -100, 100];

% Calcular modos de vibração (frequências naturais) e formas modais
[eigenmodes, eigenfrequencies] = eig(K, M);

% Extrair frequências naturais
natural_frequencies = sqrt(diag(eigenfrequencies));

fprintf('Frequências Naturais do Sistema:\n');
disp(natural_frequencies);

% Definir a frequência angular como uma variável
omega = 4.6821;

% Adicionar um vetor de força externa (F_ext) no código
F_ext = @(t) [-10 * sin(omega * t); 0]; % Força na direção x2

equacao_movimento = @(t, x) [
    x(3);
    x(4);
    -M \ (C * x(3:4) + K * x(1:2) + F_ext(t))
];

% Condições iniciais
x1_0 = 0;
x2_0 = 0;
x1_dot_0 = 0;
x2_dot_0 = 0;

y0 = [x1_0; x2_0; x1_dot_0; x2_dot_0];

% Intervalo de tempo
tspan = [0 10];

% Resolver as equações de movimento acopladas usando ode45
[t, x] = ode45(equacao_movimento, tspan, y0);

% Criar uma nova figura para o gráfico
figure;

% Gráfico da posição x1(t)
subplot(2, 1, 1);
plot(t, x(:, 1), 'r', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('x1 (m)');
title('Resposta Temporal Forçada de x1(t), para \omega = 4.6821 rad/s');
grid on;

% Gráfico da posição x2(t)
subplot(2, 1, 2);
plot(t, x(:, 2), 'b', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('x2 (m)');
title('Resposta Temporal Forçada de x2(t), para \omega = 4.6821 rad/s');
grid on;

