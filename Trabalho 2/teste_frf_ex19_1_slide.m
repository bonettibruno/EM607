clc;
clear all;
close all;

syms s;
syms w;

Z = [s^2 + 40*s + 3000, -20*s - 1500;
     -20*s - 1500, s^2 + 40*s + 3000];
disp(Z)
H = inv(Z);
% Obtenha os coeficientes da equação característica
H = subs(H, s, 1j*w);


% Define a frequência de 0 a 100 rad/s com passo de 1 rad/s
frequencies_rad_per_sec = 0:1e-2:100;

% Inicializa os vetores para armazenar os resultados
coefficients = zeros(length(frequencies_rad_per_sec), 2, 2);

% Calcula os coeficientes da equação característica
for i = 1:length(frequencies_rad_per_sec)
    H_freq = subs(H, w, frequencies_rad_per_sec(i));
    
    coefficients(i, :, :) = H_freq;
end

% Plota os gráficos
figure;

for i = 1:2
    for j = 1:2
        subplot(2, 2, (i-1)*2 + j);
        plot(frequencies_rad_per_sec, abs(squeeze(coefficients(:, i, j))));
        title(['Coeficiente H' num2str(i) num2str(j)]);
        xlabel('Frequência (rad/s)');
        ylabel(['|H' num2str(i) num2str(j) '|']);
    end
end
