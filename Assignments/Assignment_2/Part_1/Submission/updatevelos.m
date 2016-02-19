%Paige Arthur and Darren Combs
%Assignment 2
%Feb 2, 2016

%Purpose: to compute the velocities of the moon, earth, and spacecraft

%Inputs: time incriment, location of the earth, moon, and spacecraft:
%        dt = time incriment (in seconds)
%        x_S = x coordinate of spaceship
%        y_S = y coordinate of spaceship
%        x_M = x coordinate of moon
%        y_M = y coordinate of moon
%        x_E = x coordinate of earth
%        y_E = y coordinate of earth

%Outputs: new locations of the earth, moon, and spacecraft
%        x_S = x coordinate of spaceship
%        y_S = y coordinate of spaceship
%        x_M = x coordinate of moon
%        y_M = y coordinate of moon
%        x_E = x coordinate of earth
%        y_E = y coordinate of earth

function [v_Sx, v_Sy, v_Mx, v_My ] = updatevelos(dt, v_Sx, v_Sy, v_Mx, v_My, a_Sx, a_Sy, a_Mx, a_My)

%compute velocity of spacecraft
v_Sx = v_Sx + dt*a_Sx;
v_Sy = v_Sy + dt*a_Sy;

%compute velocity of moon
v_Mx = v_Mx + dt*a_Mx;
v_My = v_My + dt*a_My;

end

