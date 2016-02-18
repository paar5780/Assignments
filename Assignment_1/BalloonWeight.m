function [W_total] = BalloonWeight(r, W_pay, W_bal, MW);

%Paige Arthur
%Assignment 1, Problem 3
%Jan 19th, 2016

%Purpose: to compute the total weight of a balloon
%Inputs: radius, weight of payload, weight of empty ballon, molecular
%weight of gas used to fill balloon
%Outputs: total weight of balloon

%set constants
rho_0 = 1.225; %kg.m^3

%compute weight of gas inside balloon
W_gas = (4*pi*rho_0*r^3 / 3) * (MW / 28.966);

%compute total weight of balloon
W_total = W_gas + W_pay + W_bal;

end
