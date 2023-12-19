% Define o intervalo de tempo de 0 a 10 segundos
t = 0:0.01:10;

% Defina a equa��o para F_T(t)
F_T = 30.4 * sin(33.915 * t + 0.221) + 8.78 * cos(33.915 * t + 0.221);

% Plote o gr�fico
plot(t, F_T);
title('For�a Transmitida ao suporte E');
xlabel('Tempo (s)');
ylabel('F_T(N)');
grid on;
