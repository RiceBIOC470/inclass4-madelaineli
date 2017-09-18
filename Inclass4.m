% AW: Good job. 0.99/1.

%Inclass assignment 4. Due at the start of class on 9/12/17
function Inclass4()
%1. (a) Write code that makes a file with the words "Random numbers 1" on its
%own line, then 10 lines with 13 random numbers each, then "Random numbers
%2" on its own line, then 9 lines with 7 random numbers each. (b) Write code
%that reads only the first line of random numbers in the file and stores
%them as numbers in an array. 
    filename = 'inclass4.txt';
    fid = fopen(filename, 'w');
    fprintf(fid, 'Random numbers 1 \n');    

    %part a
    for i = 1:10
        randnum = num2str(rand([1,13]));
        fprintf(fid, randnum);
        fprintf(fid,'\n');
    end
    fprintf(fid, 'Random numbesr 2 \n');
    for i = 1:9
        randnum = num2str(rand([1,7]));
        fprintf(fid, randnum);
        fprintf(fid,'\n');
    end

    type inclass4.txt

    %part b
    %AW: This works - you only needed the info in array 1, not array 2 but that is good as well. 
    fid = fopen(filename, 'r');
    array_1 = [];
    array_2 = [];
    for i = 1:13
        line = fgetl(fid);
        text = textscan(line, '%s');
        if i == 2
            for j = 1:length(text{1})
                array_1 (j) = str2num(text{1}{j});
            end
        end
        if i == 13
            for j = 1:length(text{1})
                array_2 (j) = str2num(text{1}{j});
            end
        end
    end
    logical = sum_greater_than_ten([1,2,3,4,5,6,0]);
    disp(logical)
end

% 2. Write a function that takes an array as input and returns a logical
% variable which is true if the sum of the numbers in the array is greater
% than or equal to 10 and false if it is less than 10. 

%AW: this is basically fine, but note that logically is a builtin matlab keyword. Inside your function, 
%you will have overiden it and replaced it with your variable.

%AW: also, this doesn't give the right answer if the sum is exactly 10 - should have been >=. -0.01.
function logical = sum_greater_than_ten(A)
    logical = sum(A)>10;
end

