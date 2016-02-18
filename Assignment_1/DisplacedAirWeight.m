function [W_air] = DisplacedAirWeight(r, h)

%Paige Arthur
%Assignment 1, Problem 3
%Jan 19th, 2016

%Purpose: to compute the weight of displaced air for a balloon
%Inputs: radius, altitude
%Outputs: weight of the air displaced


%compute pressure and temperature for given altitude 
if h < 0
    fprintf('Altitude must be positive')
    P = 0;
    T = 0;
elseif h <= 11000
    T = 15.04 - 0.00649*h;
    P = 101.29*((T+273.1)/288.08)^5.256;
elseif h <= 25000
    T = -56.46;
    P = 22.65*10^(1.73-0.000157*h);
else
    T = -131.21 + 0.00299*h;
    P = 2.488*((T+273.1)/ 216.6)^-11.388;
end

%compute air density at given altitude
rho = P / 0.2869 / (T + 273.1);

%compute weight of displaced air
W_air = 4*pi*rho*r^3 / 3;

end
