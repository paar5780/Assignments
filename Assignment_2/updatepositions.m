
%Paige Arthur and Darren Combs
%Assignment 2
%Feb 2, 2016

%Purpose: to compute the positons of the moon, earth, and spacecraft

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


function [x_S, y_S, x_M, y_M] = updatepositions(dt, x_S, y_S, x_M, y_M, x_E, y_E, v_Sx, v_Sy, v_Mx, v_My, v_Ex, v_Ey)

%compute new position of spacecraft
x_S = x_S + dt*v_Sx;
y_S = y_S + dt*v_Sy;

%compute new position of moon
x_M = x_M + dt*v_Mx;
y_M = y_M + dt*v_My;

%compute new position of earth
x_E = x_E + dt*v_Ex;
y_E = y_E + dt*v_Ey;
end

