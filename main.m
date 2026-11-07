% L0324033_NOER AFDILA

clc; clear; close all;

f = @(x,y) (4*x.^3 - 2*x + 1)./(2 + y);

a = 0;              % batas awal
b = 2;              % batas akhir
y0 = 1;             % kondisi awal
N = 15;             % jumlah iterasi

% ===================================
% SOLUSI ANALITIK (EKSAK)
% ===================================
% Integral dy/dx = (4x^3 - 2x + 1)/(2+y)
% ∫(2+y) dy = ∫(4x^3 - 2x + 1) dx
% y^2/2 + 2y = x^4 - x^2 + x + C
%
% Gunakan kondisi awal y(0)=1 untuk mencari C

C = (1^2)/2 + 2*1 - (0^4 - 0^2 + 0);

% Fungsi solusi eksplisit (dalam bentuk implisit namun bisa diselesaikan)
y_eksak = @(x) -2 + sqrt( 4 + 2*( x.^4 - x.^2 + x + C ) );

y_eksak_2 = y_eksak(2);    % nilai eksak y(2)

fprintf("Solusi eksak y(2) = %.10f\n", y_eksak_2);


% ===================================
% METODE EULER
[x_e, y_e] = Euler(f,a,b,y0,N);
y_euler = y_e(end);

% ===================================
% METODE HEUN
y_heun = Heun(f,a,b,y0,N);

% ===================================
% METODE RUNGE-KUTTA ORDE 4
y_rk4 = Runge4(f,a,b,y0,N);


% ===================================
% GALAT TIAP METODE
% ===================================
err_e_abs = abs(y_eksak_2 - y_euler);
err_h_abs = abs(y_eksak_2 - y_heun);
err_r_abs = abs(y_eksak_2 - y_rk4);

err_e_rel = err_e_abs / abs(y_eksak_2);
err_h_rel = err_h_abs / abs(y_eksak_2);
err_r_rel = err_r_abs / abs(y_eksak_2);

fprintf("\n================== HASIL ==================\n");
fprintf("Eksak y(2)                = %.10f\n", y_eksak_2);
fprintf("Euler y(2)                = %.10f | Galat Abs = %.10f | Galat Rel = %.10f\n", y_euler, err_e_abs, err_e_rel);
fprintf("Heun y(2)                 = %.10f | Galat Abs = %.10f | Galat Rel = %.10f\n", y_heun, err_h_abs, err_h_rel);
fprintf("Runge-Kutta Orde 4 y(2)   = %.10f | Galat Abs = %.10f | Galat Rel = %.10f\n", y_rk4, err_r_abs, err_r_rel);
