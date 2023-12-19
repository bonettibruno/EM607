clc;
clear all;
close all;

syms lambda;


% A = [0 0 0 1 0 0; 
%      0 0 0 0 1 0;
%      0 0 0 0 0 1;
% 	 -6000 4000 0 -150 100 0;
%      1600 -2800 1200 40 -70 30;
%      0 6000 -6000 0 150 -150];
 
%sistema = A - lambda * eye(size(A));

% disp(eig(sistema));

A = [0 0 1 0;
     0 0 0 1;
     -3000 1500 -40 20;
     1500 -3000 20 -40];
%  
% sistema = A - lambda * eye(size(A));

% Calculate eigenvalues and eigenvectors
[V, D] = eig(A);

% Extract the diagonal matrix of eigenvalues
eigenvalues = diag(D);

autovalor = -30 + 60j;

% Find the index of the eigenvalue closest to the provided complex value
[~, index] = min(abs(eigenvalues - (autovalor)));

% Extract the corresponding eigenvector
eigenvector = V(:, index);

disp('Eigenvector corresponding to the given eigenvalue:');
disp(eigenvector);

 