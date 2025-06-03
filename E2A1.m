clc;clear;

fourier = @(n, t) ((-1)^n * (-4) * cos(n * t)) / n^2;
t_vals =linspace(-pi, pi, 1000);
x_vals = pi^2 - t_vals.^2;

n = [1, 2, 3, 5, 10, 20];

figure;
for i=1:length(n)
    nmax=n(i);
    S = (2/3)*pi^2 * ones(size(t_vals));

    for k=1:nmax
        S = S + fourier(k, t_vals);
    end

    err = sqrt(mean((S - x_vals).^2));

    subplot(2, 3, i);
    plot(t_vals, x_vals, 'k', 'LineWidth', 1.5);
    hold on;
    plot(t_vals, S, 'r', 'LineWidth', 1.5);
    grid on;
    title(sprintf('terms: %d, msre = %.4f',nmax, err));
    legend('π^2 - t^2', 'Fourier Series', 'Location', 'northeast');

end
sgtitle('Προσεγγίσεις με Τριγωνομετρική Σειρά Fourier');


