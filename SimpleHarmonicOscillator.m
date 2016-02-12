% Alexandra Voinea av348@cornell.edu
% MAE 2030 Dynamics, Spring 2016, Cornell University

%---------------------------------------------------

param.accel = 1; %acceleration (m/s^2)
param.mass = 0.5;  % (kg)  mass of body
param.springElastic = 3.0; % (N/m) k 
param.unstretchedLength = 0.25; %unstretched length

% Initial state:
x0 = 1;  %initial position
dx0 = 0.5; %initial x vel.

% Initial state vector
z0 = [x0;dx0];  

% Set up for ODE45
time = linspace(0,10,100);
[time, pos] = ode45(@SimpleHarmonicOscillator,time,z0);
[time, vel] = ode45(@SimpleHarmonicOscillator,time,z0);
% Analytical result of position vector
xanalyt= a*m/k + (x0 - a*m/k)*cos(sqrt(k/m)*time)+dx0*sin(sqrt(k/m)*time)/sqrt(k/m);

% Plot state vs time:
figure(2); clf;

% Plot position vs time:
subplot(3,1,1);
plot(time, pos(:,1), 'g')
xlabel('time (s)')
ylabel('x position (m)');
title('Position')

% Plot velocity vs time:
subplot(3,1,2);
plot(time, vel(:,2), 'r')
xlabel('time (s)')
ylabel('x velocity (m)');
title('Velocity')

% Plot difference vs time:
subplot(3,1,3);
plot(time, pos(:,1)-xanalyt, 'b')
xlabel('time (s)')
ylabel('difference (m)');
title('Difference')

    function dz = SimpleHarmonicOscillator(t,z)
              
        % Unpack state:
        x = z(1); % Horizontal position 
        dx = z(2); % Horiz. velocity
        
        % Unpack parameters:
        a = param.accel; 
        m = param.mass;
        k = param.springElastic;
      
        % Equations of motion:  (compute accel.)
        ddx = a - k*x/m;
        % Pack up derivatives:
        dz = [dx;ddx];
        
    end

  

end




