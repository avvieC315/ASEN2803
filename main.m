clear
close all
clc

% Define parameters
R = 500; % Radius of the loop in meters
v0 = [0; 0; 50]; % Initial velocity vector in m/s
g = 9.81; % Gravitational acceleration in m/s^2
pos0 = [500; 0; 1250]; % Initial position vector at the bottom of the loop
theta_start = -pi; % Start angle in radians
theta_end =  pi; % End angle in radians
num_points = 100; % Number of points to calculate

% Calculate acceleration and positions
[acceleration, positions, endVelo] = calculateLoopAcceleration(R, v0, g, pos0, theta_start, theta_end, num_points);

% Display the result
disp('Acceleration at each theta:');
disp(acceleration);

disp('Positions at each theta:');
disp(positions);

% Plot the results for better visualization
theta = linspace(theta_start, theta_end, num_points);

figure;
subplot(2, 1, 1);
plot3(positions(1, :), positions(2, :), positions(3, :));
xlabel('X (m)');
ylabel('Y (m)');
zlabel('Z (m)');
title('Position in the Loop');
grid on;
axis equal;

subplot(2, 1, 2);
plot(theta, acceleration(1, :), 'r', 'DisplayName', 'a_x');
hold on;
plot(theta, acceleration(2, :), 'g', 'DisplayName', 'a_y');
plot(theta, acceleration(3, :), 'b', 'DisplayName', 'a_z');
xlabel('Theta (radians)');
ylabel('Acceleration (m/s^2)');
legend;
title('Acceleration Components in the Loop');
grid on;


