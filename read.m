%function that takes a file in input and gives as an output the matrix with
%noise conained in the csv file. 
function X = read(file)

    s1 = 'H:\MATLAB\TravailMaster\MyCode\data\all_data\';
    s = strcat(s1,file);
    K = csvread(s);
    X = K(:,[1 2 3]);

end 


