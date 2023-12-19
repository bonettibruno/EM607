% Define o intervalo de tempo de 0 a 10 segundos
t = 0:0.01:10;

% Defina as equa��es para F_T,E(t) e F_T,total(t)
F_T_E = 30.4 * sin(33.915 * t + 0.221) + 8.78 * cos(33.915 * t + 0.221);
F_T_total = 45.6 * sin(33.915 * t + 0.221) + 13.18 * cos(33.915 * t + 0.221);

% Crie a primeira aba para a for�a transmitida ao suporte E
figure;
plot(t, F_T_E);
title('For�a Transmitida ao Suporte E');
xlabel('Tempo (s)');
ylabel('F_T,E (N)');
grid on;

% Crie a segunda aba para a for�a transmitida total
figure;
plot(t, F_T_total);
title('For�a Transmitida Total');
xlabel('Tempo (s)');
ylabel('F_T,Total (N)');
grid on;

% Crie a terceira aba para a rela��o entre F_T,E e F_T,total
figure;
plot(t, F_T_E./F_T_total);
title('Rela��o entre F_T,E e F_T,Total');
xlabel('Tempo (s)');
ylabel('F_T,E / F_T,Total');
grid on;
