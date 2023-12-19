clc;
clear all;
close all;

syms s;
syms w;

Z = [2*s^2 + 300*s + 12000, -200*s - 8000, 0;
     -200*s - 8000, 5*s^2 + 350*s + 14000, -150*s - 6000;
     0, -150*s - 6000, s^2 + 150*s + 6000];

% Substituindo s por jw na matriz Z, e dps achando a inversa de Z que é H
Z = subs(Z, s, 1j*w);
H = inv(Z);

% Define a frequência de 0 a 100 rad/s com passo de 0,01 rad/s
frequencies_rad_per_sec = 0:1e-2:100;

% Inicializa os vetores para armazenar os resultados
coefficients = zeros(length(frequencies_rad_per_sec), 3, 3);

% Calcula os coeficientes da equação característica
for i = 1:length(frequencies_rad_per_sec)
    H_freq = subs(H, w, frequencies_rad_per_sec(i));
    
    coefficients(i, :, :) = H_freq;
end

% Plota os gráficos
figure;

for i = 1:3
    for j = 1:3
        subplot(3, 3, (i-1)*3 + j);
        plot(frequencies_rad_per_sec, abs(squeeze(coefficients(:, i, j))));
        title(['Coeficiente H' num2str(i) num2str(j)]);
        xlabel('Frequência (rad/s)');
        ylabel(['|H' num2str(i) num2str(j) '|']);
    end
end

