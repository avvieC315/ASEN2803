function [a, pos, velocity] = calculateLoopAcceleration(R, v0, g, pos0, theta_start, theta_end, num_points)
    % calculateLoopAcceleration computes the acceleration at each theta
    % for a vertical circular loop under gravity and also returns the positions.
    %
    % Inputs:
    %   R          - radius of the loop
    %   v0         - initial velocity vector [vx; vy; vz]
    %   g          - gravitational acceleration (default is 9.81 m/s²)
    %   pos0       - initial position vector [x0; y0; z0]
    %   theta_start - start angle in radians
    %   theta_end  - end angle in radians
    %   num_points - number of points to calculate between theta_start and theta_end
    %
    % Outputs:
    %   a   - 3 x num_points matrix of accelerations at each theta
    %   pos - 3 x num_points matrix of positions at each theta

    % Generate theta values
    theta = linspace(theta_start, theta_end, num_points);
    
    % Preallocate acceleration and position matrices
    a = zeros(3, num_points);
    pos = zeros(3, num_points);
    
    % Initial position and velocity
    pos(:, 1) = pos0;
    velocity = v0;
    
    % Calculate positions and accelerations at each theta
    for i = 1:numel(theta)
        % Current angle
        th = theta(i);
        
        % Position on the loop in Cartesian coordinates (zx plane)
        pos(:, i) = pos0 + R * [cos(th); 0; sin(th)];
        
        % Centripetal acceleration
        a_centripetal = (norm(velocity)^2 / R) * [cos(th); 0; sin(th)];
        
        % Gravitational acceleration
        a_gravity = [0; 0; -g];
        
        % Total acceleration
        a(:, i) = a_centripetal + a_gravity;
        
        % Update position for the next step (this step assumes small angle approximation)
        if i < numel(theta)
            dt = theta(i+1) - theta(i);
            velocity = velocity + a(:, i) * dt;
            pos(:, i+1) = pos(:, i) + velocity * dt;
        end
    end
end