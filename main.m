clear 
close
clc

%% Initial Conditions
init_pos = [0, 0, 1250];
init_velocity = [0,0,0];
g = 9.81;

%% Loop parameters + loop run
thetaSpace = pi:0.01:3*pi/2;
radius = 500;
[position,velocity,normal_acc] = loopXZ(thetaSpace, radius, init_pos, init_velocity, g);
