%function with input: a matrix, output: an image of the matrix in black and
%white: 255: white, 0: black.

function [im] = image_mat_nb(matrix)
    im = imshow(matrix);
end