clc
clear
close all

% Define the loop parameters
R = 1000; % radius of the loop
g = 9.81; % acceleration due to gravity in m/s^2
num_points = 100; % number of points along the loop
s = linspace(-3*pi/2, pi/4, num_points); % parameter along the loop (pi to 3*pi/2)

% Starting height
z_start = 1250; % starting height in meters

% Parametric equations for a quarter circular loop in the z-x plane
x = R * cos(s);
y = zeros(size(s)); % No initial velocity in the y-direction
z = R * sin(s) + z_start;

% Initial conditions
v0 = 20; % initial velocity at the top of the loop
v = zeros(size(s));
a = zeros(size(s));

% Calculate velocity and acceleration at each point considering gravity
for i = 1:num_points
    % Height difference from the starting point
    height_diff = z_start - z(i);
    
    % Velocity using conservation of energy (v^2 = v0^2 + 2*g*height_diff)
    if i == 1
        v(i) = v0;
    else
        v(i) = sqrt(v0^2 + 2 * g * height_diff);
    end
    
    % Radial (centripetal) acceleration
    a_radial = v(i)^2 / R;
    
    % Total acceleration vector components
    ax(i) = -a_radial * cos(s(i));
    ay(i) = 0; % no acceleration in the y-direction
    az(i) = -a_radial * sin(s(i)) - g; % centripetal and gravitational acceleration
    
    % Total acceleration magnitude
    a(i) = sqrt(ax(i)^2 + ay(i)^2 + az(i)^2);
end

% Plot the loop path in 3D
figure;
plot3(x, y, z, 'b-', 'LineWidth', 2);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Roller Coaster Quarter Loop Path in 3D (z-x plane)');
grid on;
axis equal;

% Plot the acceleration
figure;
plot(s, a, 'r-', 'LineWidth', 2);
xlabel('Parameter s');
ylabel('Acceleration (m/s^2)');
title('Acceleration along the Quarter Loop');
grid on;

