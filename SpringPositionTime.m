% Alexandra Voinea av348@cornell.edu
% MAE 2030 Dynamics, Spring 2016, Cornell University

%---------------------------------------------------
%Linear and Non Linear Plots of Position versus Time

param.mass = 1.0;  % (kg)  mass of body
param.gravity = 9.81;  % (m/s^2)  gravity accel.
param.springElastic = 1.0; % (N/m) k 
param.springConst = 5.0; % (N/m^3) c
param.unstretchedLength = 0.25; %unstretched length

% Initial state:
x0 = 0.4;  %initial position
dx0 = 0.0; %initial x vel.

% Initial state vector
z0 = [x0;dx0];   

% Set up for ODE45
time = linspace(0,20,100);
[time, slin] = ode45(@LinearSpring,time,z0);
[time, snonlin] = ode45(@NonLinearSpring,time,z0);

% Plot state vs time:
figure(1); clf;

plot(time,slin(:,1), 'b--o')
xlabel('time (s)')
ylabel('x position (m)');
title('Linear and Non-Linear') 
hold on;
plot(time,snonlin(:,1), 'r--');
legend('Linear', 'Non-Linear');

%Linear Spring Function
    function dz = LinearSpring(t,z)
              
        % Unpack state:
        x = z(1); % Horizontal position of ball
        dx = z(2); % Horiz. velocity
        
        % Unpack parameters:
        m = param.mass;
        g = param.gravity;
        k = param.springElastic;
        c = param.springConst;
        xct = param.unstretchedLength;
        
        % Equations of motion:  (compute accel.)
        ddx = -k*(x-xct)/m;
        
        % Pack up derivatives:
        dz = [ dx;ddx];
        
    end

% Non Linear Function 
  function dz = NonLinearSpring(t,z)
              
        % Unpack state:
        x = z(1); % Horizontal position of ball
        dx = z(2); % Horiz. velocity
        
        % Unpack parameters:
        m = param.mass;
        g = param.gravity;
        k = param.springElastic;
        c = param.springConst;
        xct = param.unstretchedLength;
        
        % Equations of motion:  (compute accel.)
        ddx = -k*(x-xct)/m-c*(x-xct)^3/m;
        
        % Pack up derivatives:
        dz = [ dx;ddx];
        
    end
