function [position,velocity,acceleration] = loopXZ(thetaSpace,radius, init_pos, init_velocity, g)
%LOOP Summary of this function goes here
%   thetaSpan - [thetaStart, thetaEnd]
%   radius - radius of loop
%   init_pos - [x; y; z]

position = zeros(length(thetaSpace),3);
velocity = zeros(length(thetaSpace),3);
normal_acc = zeros(length(thetaSpace),1);
acceleration = zeros(length(thetaSpace),3);

for i = 1:length(thetaSpace)
    position(i, :) = init_pos + [radius .* cos(thetaSpace(i)) + radius, 0, radius .* sin(thetaSpace(i))];

    deltaPos = abs(init_pos - position(i,3));
    velocity(i,:) = init_velocity + sqrt((2 .* g .* deltaPos(3))) .* [-sin(thetaSpace(i)), 0, cos(thetaSpace(i))];
    normal_acc(i,:) = norm(velocity(i,:)) .^2 /radius;
    acceleration(i,:) = abs([0,0,-g] + normal_acc(i,:) .* [-cos(thetaSpace(i)), 0, -sin(thetaSpace(i))]);
end


end

