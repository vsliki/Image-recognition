%Input: matrix (black and white)
%Output: matrix with error (grey)

function [res] = pert_mat(matrix)
    variables;
    epsilon = rand(5,3)/noise;  %divided by the amount we want to modifiy the image
    for k = 1:5 %line
        for i = 1:3 %column
            if matrix(k,i) + epsilon(k,i) > 1 %so that white pixels change colour as well
                res(k,i) = matrix(k,i) - epsilon(k,i);
            else
                res(k,i) = matrix(k,i) + epsilon(k,i);
            end 
        end 
    end 
end 
