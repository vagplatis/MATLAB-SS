clc; clear;
k = 2;
m = 9;
n = 1;

t = 0:0.01:20;

f1 = zeros(size(t));
f1(t >= k) = ((t(t >= k) - k).^2) ./ exp(n * t(t >= k));

f2 = zeros(size(t));
f2(t >= m) = ((t(t >= m) - m).^2) ./ exp(k * t(t >= m));

f = f1 + f2;

omega = linspace(-50, 50, 1000); 

s1 = n + 1j * omega;
s2 = k + 1j * omega;

F1 = 2 * exp(-s1 * k) ./ (s1.^3);
F2 = 2 * exp(-s2 * m) ./ (s2.^3);

F = F1 + F2;

figure;
subplot(2,1,1);
plot(t, f, 'b', 'LineWidth', 1.5);
title('Σήμα');
grid on;

subplot(2,1,2);
plot(omega, abs(F), 'r', 'LineWidth', 1.5);
title('Φάσμα Πλάτους');
grid on;
