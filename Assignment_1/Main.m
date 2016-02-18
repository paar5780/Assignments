%Main 

%Paige Arthur
%Assignment 1
%Jan 19th, 2016

close all;clc
fprintf('\n')

%% Bonus

%values of M greater than 10  will greatly increase computation time
N = 33; M = 10;
%randomize groups
groups = randomize(N,M);

%print out all of the groups for each assignment
for i = 1:M %for each assingment
    fprintf('\nAssignment %i \n', i)
    a = groups{i};
    for j = 1:floor(N/2) %for each group
        b = a{j};
        if b(3) ~= 0 %if there are three people in a group (odd number)
            fprintf('%i %i %i \n', b(1), b(2), b(3))
        else %if there are two people in a group
            fprintf('%i %i \n', b(1), b(2))
        end
    end
end
fprintf('\n')

%% Problem 1
Projectile(45, 50)

%% Problem 2
%initialize and plot experimental data
alpha = [-5 -2 0 2 3 5 7 10 14];
C_l = [-0.008 -0.003 0.001 0.005 0.007 0.006 0.009 0.017 0.019];
figure
plot(alpha, C_l, '*')
hold on;

%compute line of best fit and print results
[m,b] = BestFit(alpha, C_l);
fprintf ('The slope of the line of best fit for this data is %2.5f \n', m)
fprintf ('The y-intercept of the line of best fit for this data is %2.5f \n\n', b)

%format plot
title('Coefficient of Lift as a Function of Angle of Attack')
xlabel('\alpha (degrees)')
ylabel('C_l')
set(gca, 'fontsize', 12)

%% Problem 3
MW = 4.02;
r = 3.0; %m
W_pay = 5; %kg
W_bal = 0.6; %kg

h_max = MaxAltitude(r,W_pay,W_bal, MW);
fprintf('The maximum altitude for this balloon is %2.0f meters\n\n' ,h_max)