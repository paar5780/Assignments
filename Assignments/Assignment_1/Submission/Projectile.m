function [] = Projectile(theta,v)

%Paige Arthur
%Assignment 1, Problem 1
%Jan 19th, 2016

%Purpose: to graph the vertical and horizontal position of a projectile
%Inputs: initial velocity (m/s) and angle (degrees)
%Outputs: graphs of vertical and horizontal position as a function of time

g = -9.81; %m/s^2

%find the time at which it hits the ground
t_final = roots([0.5*g v*sind(theta) 0]);
t_final = t_final(2);
%create and array of time values
t = linspace(0, t_final);

%compute the x and y positions
x = v*cosd(theta)*t;
y = 0.5*g*t.^2 + v*sind(theta)*t;

%plot and format
figure
plot(t,x)
title('Horizontal Position Over Time')
xlabel('time (s)')
ylabel('x-position (m)')
set(gca, 'fontsize', 12)
xlim([t(1) t(end)])

figure
plot(t,y)
title('Vertical Position Over Time')
xlabel('time (s)')
ylabel('y-position (m)')
set(gca, 'fontsize', 12)
xlim([t(1) t(end)])

%print results
fprintf('The projectile reaches a maximum height of %2.2f meters \n',max(y))
fprintf('The projectile travels a distance of of %2.2f meters \n',x(end))
fprintf('The projectile is in the air for %2.2f seconds \n\n',t_final)

end

