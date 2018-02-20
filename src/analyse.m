clear

filename = '../data/20150601_053947_385.log.csv';

% import data (+ trim 10 possible incomplete samples)
M = csvread(filename, 10, 0);

% parsing
% data: 142249.04,4913.63631506,01634.53113072,-0006.849,-0008.292,-0000.558,0.26,47.268,0.00,0.00,0,0,9676179,2010996,-19079139,-15290034
utc = mod(M(:, 1), 100) + mod(fix(M(:, 1) / 100), 100) * 60 + fix(M(:, 1) / 10000) * 3600; % [s]
n = M(:, 4);
e = M(:, 5);
u = M(:, 6);
v = M(:, 7);
a = M(:, 8);

t = utc - utc(1);

% === GRAPHS ===
figure(1)
clf

subplot(4, 1, 1)
plot(e, n)
axis equal
grid on

subplot(4, 1, 2)
plot(t, e)
xlabel('time [s]')
grid on

subplot(4, 1, 3)
plot(t, a)
xlabel('time [s]')
ylabel('heading [deg]')
grid on

subplot(4, 1, 4)
plot(t, v)
xlabel('time [s]')
ylabel('horizontal speed [km/s]')
grid on
