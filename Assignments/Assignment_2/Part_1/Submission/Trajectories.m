
%Paige Arthur and Darren Combs
%Assignment 2
%Feb 2, 2016

%Purpose: to compute the trajectory of Apollo 13 and determine if it gets back to Earth

%Inputs: delta vs (velocity changes) and if we want to plot the trajectory
         %delta_v_x = change in velocity in x direction
         %delta_v_y = change in velocity in y direction
         %plotting = true if want to plot trajectory, false if not

%Outputs: time it takes to end mission, whether or not mission was success
%         t = time in seconds that it takes for mission to end
%         success = true if astronauts got back to earth, false if not

function [t,success] = Trajectories(delta_v_x, delta_v_y, plotting)

%time step in seconds
%a smaller time step will give greater precision
dt = 30;

%maximum of 100 hours before cutting it off, otherwise it takes too long to run
t_max = 100 * 3600;

% constants
m_M = 7.34767309*10^22; %kg
m_E = 5.97219*10^24;    %kg
m_S = 28833;            %kg
r_M = 1737100;          %m
r_E = 6371000;          %m
G = 6.674*10^-11;       %N(m/kg)^2

% initial conditions
d_EM = 384403000;                             %m
d_ES = 340000000;                             %m
theta_S = deg2rad(50);                        %rad
theta_M = deg2rad(42.5);                      %rad
v_S = 1000;                                   %m/s
x_S = d_ES * cos(theta_S);                    %m
y_S = d_ES * sin(theta_S);                    %m
v_Sx = v_S * cos(theta_S) + delta_v_x;        %m/s
v_Sy = v_S * sin(theta_S) + delta_v_y;        %m/s
x_M = d_EM * cos(theta_M);                    %m
y_M = d_EM * sin(theta_M);                    %m
v_M = sqrt(G*m_E^2 / (m_E + m_M) / d_EM);     %m/s
v_Mx = -v_M * sin(theta_M);                   %m/s
v_My = v_M * cos(theta_M);                    %m/s
x_E = 0;                                      %m
y_E = 0;                                      %m
v_Ex = 0;                                     %m/s
v_Ey = 0;                                     %m/s
termination = false;
success = false;

%initialize arrays for the paths of the objects to be plotted
SpaceCraft_Path = [];
Moon_Path = [];

i = 1; %counter
t = 0; %time in seconds
while termination == false %while the mission is ongoing
    %compute the acceleration of the objects
    [a_Mx, a_My, a_Sx, a_Sy, d_EM, d_ES, d_MS] = acceleration (x_E, y_E,x_M, y_M, x_S, y_S);
    
    %compute the velocities of the objects
    [v_Sx, v_Sy, v_Mx, v_My ] = updatevelos(dt, v_Sx, v_Sy, v_Mx, v_My, a_Sx, a_Sy, a_Mx, a_My);
    
    %compute the positions of the objects
    [x_S, y_S, x_M, y_M] = updatepositions(dt, x_S, y_S, x_M, y_M, x_E, y_E, v_Sx, v_Sy, v_Mx, v_My, v_Ex, v_Ey);
    
    %update path arrays
    SpaceCraft_Path(i,1) = x_S; SpaceCraft_Path(i,2) = y_S;
    Moon_Path(i,1) = x_M; Moon_Path(i,2) = y_M;
    
    %increment time and counter
    t = t + dt;
    i = i + 1;
    
    %determine if mission has ended, and if so, if it was sucessful
    if d_MS <= r_M %if they crash into the moon
        termination = true;
    elseif d_ES >= 2*d_EM %if they float off into space
        termination = true;
    elseif t > t_max; %if too much time passes
        termination = true;
    elseif d_ES <= r_E %if they reach earth
        termination = true;
        success = true;
    end   
    
end

%if the mission was succesful and we wish to plot their path home
if plotting == true && success == true
    
    %print time to get home and delta v necessary to get there
	fprintf('Success! \n')
	fprintf('Time: %2.2f hours \n',t/3600 );
	fprintf('delta_v_x: %2.2f m/s \n',delta_v_x);
	fprintf('delta_v_y: %2.2f m/s \n',delta_v_y);
	fprintf('delta_v: %2.6f m/s \n\n', sqrt(delta_v_x^2+delta_v_y^2));
    
    %plot path of spacecraft and moon with respect to the earth
	figure
	hold on
	plot(SpaceCraft_Path(:,1)/1000, SpaceCraft_Path(:,2)/1000);
	plot(Moon_Path(:,1)/1000, Moon_Path(:,2)/1000);
	plot(0,0, 'g*');
	legend('SpaceCraft Path', 'Moon Path','Earth','Location','Best')
    xlabel('x Position (km)')
    ylabel('y Position (km)')
	set(gca,'fontsize',14)
end

end