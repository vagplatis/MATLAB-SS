k=1;
m=3;
dt=pi/90;
t=-6*pi:dt:6*pi;
u=@(x)double(x>=0);

% 1ο ζεύγος
x1= u(t+2)-u(t-1);
y1= (t+1) .* (t>=-m & t<k);
z1 = @(t) (t >= -5 & t <= -2) .* (t.^2 + 6*t + 5)/2 + ...
         (t > -2 & t <= -1)  .* (6*t + 9)/2 + ...
         (t > -1 & t <= 2)   .* (-(t.^2 - 4))/2;

figure;
subplot(3,1,1); plot(t, x1); title('x_1(t)'); grid on;
subplot(3,1,2); plot(t, y1); title('y_1(t)'); grid on;
subplot(3,1,3); plot(t, z1(t)); title('x_1 * y_1'); grid on;

% 2ο ζεύγος
x2= t .* u(t+m);
y2= exp(-m*t) .* u(t-k);
z2 = @(t) (t >= -2) .* (10*exp(-3*t-9)/9 + exp(-3)*(3*t-4)/9) + (t < -2) .* 0;

figure;
subplot(3,1,1); plot(t, x2); title('x_2(t)'); grid on;
subplot(3,1,2); plot(t, y2); title('y_2(t)'); grid on;
subplot(3,1,3); plot(t, z2(t)); title('x_2 * y_2'); grid on;

% 3ο ζεύγος
x3= exp(-k*t) .* (u(t+m) - u(t));
y3= k*u(t);
z3 = @(t) (exp(3) - exp(t)) .* (t >= -3 & t <= 0) + (exp(3) - 1) .* (t > 0);

figure;
subplot(3,1,1); plot(t, x3); title('x_3(t)'); grid on;
subplot(3,1,2); plot(t, y3); title('y_3(t)'); grid on;
subplot(3,1,3); plot(t, z3(t)); title('x_3 * y_3'); grid on;

% 4ο ζεύγος
x4= sin(k*t);
y4= exp(-m*t);


figure;
subplot(2,1,1); plot(t, x4); title('x_4(t)'); grid on;
subplot(2,1,2); plot(t, y4); title('y_4(t)'); grid on;

% 5ο ζεύγος
x5= m*(t >= -k*pi & t < k*pi);
y5= cos(m*t);
z5= zeros(size(x5));

figure;
subplot(3,1,1); plot(t, x5); title('x_5(t)'); grid on;
subplot(3,1,2); plot(t, y5); title('y_5(t)'); grid on;
subplot(3,1,3); plot(t, z5); title('x_5 * y_5'); grid on;
