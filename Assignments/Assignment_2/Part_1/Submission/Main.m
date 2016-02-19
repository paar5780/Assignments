% Main

%set parameters for the range of velocities to inspect
delta_vx_min = 0;
delta_vx_max = 100;
delta_vy_min = 0;
delta_vy_max = 100;

%set initial cycle number equal to 1
m = 1;

%obtain optimal values for the change in velocity in the x and y directions
Optimize(delta_vx_min, delta_vx_max, delta_vy_min, delta_vy_max, 1);
