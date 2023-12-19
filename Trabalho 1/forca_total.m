% Define o intervalo de tempo de 0 a 10 segundos
t = 0:0.01:10;

% Defina as equações para F_T,E(t) e F_T,total(t)
F_T_E = 30.4 * sin(33.915 * t + 0.221) + 8.78 * cos(33.915 * t + 0.221);
F_T_total = 45.6 * sin(33.915 * t + 0.221) + 13.18 * cos(33.915 * t + 0.221);

% Crie a primeira aba para a força transmitida ao suporte E
figure;
plot(t, F_T_E);
title('Força Transmitida ao Suporte E');
xlabel('Tempo (s)');
ylabel('F_T,E (N)');
grid on;

% Crie a segunda aba para a força transmitida total
figure;
plot(t, F_T_total);
title('Força Transmitida Total');
xlabel('Tempo (s)');
ylabel('F_T,Total (N)');
grid on;

% Crie a terceira aba para a relação entre F_T,E e F_T,total
figure;
plot(t, F_T_E./F_T_total);
title('Relação entre F_T,E e F_T,Total');
xlabel('Tempo (s)');
ylabel('F_T,E / F_T,Total');
grid on;
