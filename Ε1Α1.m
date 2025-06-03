k = 1;
m = 3;

t = -6*pi : pi/90 : 6*pi;

u = @(x) double(x>=0);

x = @(t) (t .* cos(m*pi*t) .* u(-m*pi - t)) + ...
         (t .* sin(k*pi*t) .* u(t - k*pi)) + ...
         (cos(k*pi*t) .* sin(m*pi*t) .* (u(t + m*pi) - u(t - k*pi)));

xt = x(t);
x1 = m - xt / k;
x2 = 2 * k * x(3*t);
x3 = x(t - pi) / m;

figure;

subplot(4,1,1);
plot(t, xt);
title('x(t)');
grid on;

subplot(4,1,2);
plot(t, x1);
title('x_1(t) = m - x(t)/k');
grid on;

subplot(4,1,3);
plot(t, x2);
title('x_2(t) = 2k * x(3t)');
grid on;

subplot(4,1,4);
plot(t, x3);
title('x_3(t) = x(t - \pi)/m');
grid on;
