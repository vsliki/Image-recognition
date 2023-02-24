%this sigmoid function replaced the division with the element-wise division
%./ to account for the vector. 
% 
function y = Sigmoid(x)
    y = 1./(1+exp(-x));
end

