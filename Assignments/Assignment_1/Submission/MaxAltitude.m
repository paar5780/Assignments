function[h_max] = MaxAltitude(r,W_pay,W_bal, MW)

%Paige Arthur
%Assignment 1, Problem 3
%Jan 19th, 2016

%Purpose: to compute the maximum altitude for a balloon
%Inputs: radius, weight of payload, weight of empty ballon, molecular
%weight of gas used to fill balloon
%Outputs: maximum altitude

%find total weight of the balloon
W_total = BalloonWeight(r, W_pay, W_bal, MW);

%initialize varaibles
h = 0;
W_air = DisplacedAirWeight(r, h);

%find altitude at which the balloon is heavier than the air it displaces
while W_total < W_air
    W_air = DisplacedAirWeight(r, h);
    h = h + 10;
end
h_max = h;

end