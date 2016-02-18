
%Paige Arthur and Darren Combs
%Assignment 2
%Feb 2, 2016

%Purpose: to compute the accleration of the moon and spacecraft

%Inputs: location of the earth, moon, and spacecraft:
%        x_E = x coordinate of earth
%        y_E = y coordinate of earth
%        x_M = x coordinate of moon
%        y_M = y coordinate of moon
%        x_S = x coordinate of spaceship
%        y_S = y coordinate of spaceship

%Outputs: acceleration of moon, and spacecraft and distances between them:
%         a_Mx = acceleration of moon in x direction
%         a_My = acceleration of moon in y direction
%         a_Sx = acceleration of spacecraft in x direction
%         a_Sy = acceleration of spacecraft in y direction
%         d_EM = distance between earth and moon
%         d_ES = distance between earth and spacecraft
%         d_MS = distance between moon and spacecraft

function [a_Mx, a_My, a_Sx, a_Sy, d_EM, d_ES, d_MS] = acceleration (x_E, y_E, x_M, y_M, x_S, y_S)

%constants
G = 6.674e-11;
m_M = 7.34767309*10^22; %kg
m_E = 5.97219*10^24;    %kg
m_S = 28833;            %kg

%compute distances between objects
d_EM = sqrt((x_E - x_M)^2 + (y_E - y_M)^2);
d_ES = sqrt((x_E - x_S)^2 + (y_E - y_S)^2);
d_MS = sqrt((x_M - x_S)^2 + (y_M - y_S)^2);
  
%compute gravitational forces on objects
F_EMx = G*m_E*m_M*(x_E-x_M) / d_EM^3;
F_ESx = G*m_E*m_S*(x_E-x_S) / d_ES^3;
F_MSx = G*m_M*m_S*(x_M-x_S) / d_MS^3;
F_EMy = G*m_E*m_M*(y_E-y_M) / d_EM^3;
F_ESy = G*m_E*m_S*(y_E-y_S) / d_ES^3;
F_MSy = G*m_M*m_S*(y_M-y_S) / d_MS^3;

%compute acceleration of objects
%acceleration of the earth is assumed to be zero
a_Sx = (F_MSx + F_ESx) / m_S;
a_Sy = (F_MSy + F_ESy) / m_S;
a_Mx = (F_EMx + F_MSx) / m_M;
a_My = (F_EMy + F_MSy) / m_M;
    
end

