function [m,b] = BestFit(x,y)

%Paige Arthur
%Assignment 1, Problem 2
%Jan 19th, 2016

%Purpose: to create a line of best fit for experimental data
%Inputs: independent varible vector and dependent variable vector
%Outputs: slope m, y-intercept b, plot of experimental and best-fit data

%Compute coefficients
N = length(x);
A = sum(x);
B = sum(y);
C = sum(x.*y);
D = sum(x.^2);

%find slope and y-intercept
m = (A*B - N*C) / (A^2 - N*D);
b = (A*C - B*D) / (A^2 - N*D);

%create an appropriatly sized array for dependent variable
x_final = x(end)+1;
x_initial = x(1)-1;
x = linspace(x_initial, x_final);

%compute line of best fit
y = m*x + b;

%plot and format
plot(x, y)
legend('Experimental', 'Best Fit', 'Location', 'Best')
xlim([x_initial, x_final])

end

