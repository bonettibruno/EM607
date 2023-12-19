% Definir a fun��o que representa a equa��o de movimento
% d^2(theta)/dt^2 + 12.78 * d(theta)/dt + 1522.05 * theta = 0
equacao_movimento = @(t, y) [y(2); -12.78 * y(2) - 1522.05 * y(1)];

% Condi��es iniciais
theta_0 = 2.5 * pi / 180; % 2.5 graus convertidos para radianos
theta_dot_0 = 10 * pi / 180; % 10 graus por segundo convertidos para radianos por segundo
y0 = [theta_0; theta_dot_0];

% Intervalo de tempo
tspan = [0 2]; % Intervalo de tempo de 0 a 10 segundos (voc� pode ajustar isso)

% Resolver a equa��o de movimento usando ode45
[t, y] = ode45(equacao_movimento, tspan, y0);

% Extrair a solu��o
theta = y(:, 1);

% Converter theta de radianos para graus
theta_graus = theta * 180 / pi;

% Tra�ar a resposta temporal de theta(t)
plot(t, theta_graus);
xlabel('Tempo (s)');
ylabel('�ngulo (graus)');
title('Vibra��o livre');
grid on;
