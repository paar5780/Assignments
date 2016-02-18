function [totalCell] = randomize(N,M)

%Paige Arthur
%Assignment 1, Bonus
%Jan 21st, 2016

%Purpose: to randomize student groups for assignments
%Inputs: number of students N and number of assignments M
%Outputs: cell containing M number of cells, each which contain the student
%groups for that assignment

%assume each student's name is an integer between 1 and N with no repeats

%first, determine if there is an odd number of students
%if so, this will be noted and delt with later. 
N_true = N;
if mod(N,2) ~= 0 %odd
    N = N - 1;
    odd = true;
else %even
    odd = false;
end

%for each assignment
for m = 1:M
    
    %create a random assortment of N numbers
    unsorted = N*rand(N,1);
    
    %sort random assortment, but keep original order
    sorted = sort(unsorted);
    
    %initialize pairings array
    pair = zeros(N,1);
    
    %based on the ordering of the randomly generated numbers, 
    %randomly mix the students into a vector array
    for i = 1:N %sorted array
        for j = 1:N %unsorted array
            if unsorted(j) == sorted(i)
                pair(i) = j;
            end
        end
    end
    
    %now, the array 'pair' is a vector array of ints 1:N randomly placed
    %split the vector array in half to make pairs
    %e.g., if there are 20 students, the student in 1st place will be
    %paired with the student in 11th place, etc
    group = zeros(N/2,3); %third column in case of odd number of students
    group(:,1) = pair(1:N/2);
    group(:,2) = pair(N/2+1:end);
    
    %if there was an odd number of students, place the last student in the 
    %first group and move the student who would have been in the first 
    %group to the last group
    %this prevents the last student from always being in the group of 3
    if odd == true %odd
        x = group(1,1);
        group(1,1) = N+1;
        group(end,3) = x;
    end
    
    %organize groups so that the student with the lower ranking comes first
    %this will allow for easier comparison of groups later
    for i = 1:N/2
        if group(i,1) > group(i,2)
            x = group(i,1);
            group(i,1) = group(i,2);
            group(i,2) = x;
        end
    end

    %store pairings in a cell
    for i = 1:N/2
       myCell(i) = {group(i,:)};
    end
    
    %put the cell (one cell per assingment) into a master cell
    totalCell(m) = {myCell};
end

%now we have a master cell array that contains cells for each assignment
%each smaller cell contains the pairings
%now we have to make sure none of the pairings are the same

%initialize variable to tell if there is a repeat
%false means no repeats, true means there is a repeat
bool = false;

for m = 1:M %for each assignment
    a = totalCell{m}; 
    for i = m+1:M %compare each assignment to all following assignments
        b = totalCell{m+1};
        for j = 1:N/2 %look at each pairing in the assignment
            for k = 1:N/2
                if a{j} == b{k} %compare to each pairing in subsequent assignments
                    bool = true; %look for repeats
                end 
            end
        end
    end
end

%if repeat, try again until no repeats using recursion
%because the likelihood of repeats increases drastically with increased
%number of assignments, the computation time will increase drastically as well
if bool == 1
   randomize(N_true,M);
end
    
end
