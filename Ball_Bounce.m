% define simulation parameters

g=9.81; %gravitational acceleration (m/s^2)
v0=10; %initial vel of ball (m/s)
h0=10; %initial height of ball (m)
tmax=15; %max sim time (s)
dt=0.01; %time step (s)

%initialize variables

t=0:dt:tmax; %time vector
y=zeros(size(t)); %height vector
v=zeros(size(t)); %velocity vector
y(1)=h0; %set the inital hieght
v(1)=v0; %set the initial velocity


% simulate the ball bouncing off the surface

for i=2:length(t)
    if y(i-1)<=0 && v(i-1)<0 % if the ball has hit the surface
       v(i)=-0.8*v(i-1); %set the velocity after bounce
       y(i)=0; % set the height after the bounce
       
    else % otherwise, continue with the freefall motion
        v(i)=v(i-1)-g*dt;
        y(i)=y(i-1)+v(i-1)*dt-0.5*g*dt^2;
    end
end 

% plot the results

plot(t,y,'LineWidth',2)
xlabel('Time(s)')
ylabel('Height(m)')
title('Ball Bouncing Simulation')
grid on
