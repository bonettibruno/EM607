% Define o intervalo de x de 0 a 10
t = 0:0.01:60;

% Defina a equação para F_T(t)
F_T = 1 ./ (3044.125 * sqrt((1 - (t.^2 / 507.15)).^2 + 0.000071 * t.^2 ));

% Plote o gráfico
plot(t, F_T);
title('FRF');
xlabel('Omega(rad/s)');
ylabel('|H(omega)|');
grid on;

