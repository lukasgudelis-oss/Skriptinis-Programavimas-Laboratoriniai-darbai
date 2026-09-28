% Lukas Gudelis
% Data: 2026-09-28
% Grupe : EIF-25

%% Rezultatu grafinis 2d atvaizdavimas, 3 VARIANTAS | Pagrindine uzduotis
x = linspace(0, 200, 300);
fx = 2 * exp(-0.02 * x) .* cos(0.2 * x);

figure(1);
plot(x, fx, 'g', 'LineWidth', 10);
title('Funkcija f(x) = 2 e^{-0.02x} cos(0.2x)');
xlabel('x');
ylabel('f(x)');
grid on;
legend('f(x) = 2 e^{-0.02x} cos(0.2x)');
axis([min(x) max(x) min(fx) max(fx)]);

z1 = linspace(-pi + 0.05, -0.05, 150);
z2 = linspace(0.05, pi - 0.05, 150);
z = [z1, NaN, z2];
fz = cot(z);

figure(2);
plot(z, fz, 'b', 'LineWidth', 1.5);
title('Funkcija f(z) = cot(z)');
xlabel('z');
ylabel('f(z)');
grid on;
legend('f(z) = cot(z)');
axis([min(z) max(z) -10 10]);

x3 = 0 : 0.1 : 10*pi;
y3 = sin(x3) .* cos(x3);
z3 = cos(x3);

figure(3);
subplot(2, 1, 1);
plot3(x3, y3, z3, 'b', 'LineWidth', 1.5);
title('Trimate kreive: y(x) = sin(x)cos(x), z(x) = cos(x)');
xlabel('x');
ylabel('y');
zlabel('z');
grid on;
legend('3D kreivė');
axis([min(x3) max(x3) min(y3) max(y3) min(z3) max(z3)]);

subplot(2, 1, 2);
polarplot(x3, y3, 'm', 'LineWidth', 1.5);
title('Funkcija y(x) polarinėse koordinatese');
legend('y(x) = sin(x)cos(x)');
%% P.Signalu grafinis atvaizdavimas, 24 VARIANTAS | Papildoma uzduotis
Ampl = 6;
f = 4;
sigma = 1.2;
t = 0:0.001:1.5;
U1 = 3.5;
U2 = 2.5;

rng(1);
s = Ampl*sin(2*pi*f*t) + 0.5*Ampl*cos(4*pi*f*t);
n = sigma*randn(size(t));
s_triuksmas = s + n;

b = s_triuksmas;
b(abs(b) < U2) = 0;

asies_stilius = {'Color', 'red', 'FontSize', 13, 'FontWeight', 'bold'};
violetine = [0.5 0 0.8];

y_min = floor(min(s_triuksmas)) - 1;
y_max = ceil(max(s_triuksmas)) + 1;

figure(4);

subplot(2, 1, 1);
plot(t, s_triuksmas, 'k', 'LineWidth', 1); hold on;
plot(t, b, 'Color', violetine, 'LineWidth', 1.5);
yline(U1, '--r', 'LineWidth', 1.2);
yline(U2, '-r', 'LineWidth', 1.2);
hold off;
title('Pradinis ir filtruotas signalai');
xlabel('Laikas, t [s]', asies_stilius{:});
ylabel('Įtampa, U [V]', asies_stilius{:});
grid on;
legend('Pradinis signalas', 'Filtruotas signalas', 'U_1 riba', 'U_2 riba', ...
       'Location', 'southwest');
xlim([min(t) max(t)]);
ylim([y_min y_max]);

subplot(2, 1, 2);
idx_virsh = s_triuksmas > U1;
t_virsh = t(idx_virsh);
U_virsh = s_triuksmas(idx_virsh);
stem(t_virsh, U_virsh, 'b', 'Marker', 'o'); hold on;

idx_max = find(s_triuksmas == max(s_triuksmas));
idx_min = find(s_triuksmas == min(s_triuksmas));
plot(t(idx_max), s_triuksmas(idx_max), 'ro', ...
     'MarkerFaceColor', 'r', 'MarkerSize', 8);
plot(t(idx_min), s_triuksmas(idx_min), 's', ...
     'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'yellow', 'MarkerSize', 8);
hold off;
title('Signalo reikšmės, viršijančios U_1 ribą (diskretus formatas)');
xlabel('Laikas, t [s]', asies_stilius{:});
ylabel('Įtampa, U [V]', asies_stilius{:});
grid on;
legend('U > U_1 reikšmės', 'Maksimali reikšmė', 'Minimali reikšmė', ...
       'Location', 'southwest');
xlim([min(t) max(t)]);
ylim([y_min y_max]);
