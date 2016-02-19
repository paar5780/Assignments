
%Paige Arthur and Darren Combs
%Assignment 2
%Feb 2, 2016

%Purpose: to find the optimal delta v values to achieve the mission

%Inputs: range of delta vs in the x and y directions, cycle number:
%        x_min = smallest delta v in x direction considered
%        x_max = largest delta v in x direction considered
%        y_min = smallest delta v in y direction considered
%        y_max = largest delta v in y direction considered
%        m = the optimization cycle number currently running

%Outputs: new range of delta vs in the x and y directions, cycle number:
%         x_min = smallest delta v in x direction considered
%         x_max = largest delta v in x direction considered
%         y_min = smallest delta v in y direction considered
%         y_max = largest delta v in y direction considered
%         m = the optimization cycle number currently running

function [x_min,x_max, y_min, y_max, m] = Optimize(x_min, x_max, y_min, y_max, m)

%maximum of 100 hours before cutting it off, otherwise it takes too long to run
t_opt = 100 * 3600;

%create a 10x1 array for delta_v in the x and y directions
n = 10;
delta_v_x = linspace(x_min, x_max, n+1);
delta_v_y = linspace(y_min, y_max, n+1);

%iterate through 10 changes in the y velocity and 10 changes in the x velocity
%for a total of 100 iterations per cycle
for i = 1:length(delta_v_x)      %for each change in the x velocity
    for j = 1:length(delta_v_y)  %for each change in the y velocity
        %compute the astronauts' trajectory
        [t,success] = Trajectories(delta_v_x(i), delta_v_y(j),false); 
        if  success == true;     %if the astronauts made it back
            if t < t_opt;        %if they got back in less time than before
                %record new optimal delta v and new time
                t_opt = t;
                x_opt = delta_v_x(i);
                y_opt = delta_v_y(j);
            end
        end
    end
end

%m counts the number of optimization cycles
%larger m values will give greater precision
m_max = 5; 
m = m + 1;

%"zoom in" on the optimal values to re-run the optimization cycle with greater precision
%diving by m ensures that each cycle is more precise than the last
%it calculates the new range based on the previously calculated optimal value, 
%so if the optimal value is zero than the range won't change
%that's why there is a special case for a delta v of zero
if x_opt ~= 0
    x_min = x_opt - x_opt*0.1/m; 
    x_max = x_opt + x_opt*0.1/m;
else 
    x_min = -1/m; 
    x_max = 1/m;
end
if y_opt ~= 0
    y_min = y_opt - y_opt*0.1/m; 
    y_max = y_opt + y_opt*0.1/m;
else
    y_min = -1/m;
    y_max = 1/m;
end

%run the optimization cycle again with new, more precise values
%until it has been run the desired number of times
%use recursion, the function calls itself
if m < m_max
    Optimize(x_max, x_min, y_max, y_min, m);
else
    %once the cycles are done, plot the trajectory and record the results
    Trajectories(x_opt, y_opt, true);
end

end




