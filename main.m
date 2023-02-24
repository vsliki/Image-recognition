%import the NN
NN; 



for k = 1: length(validation_set')
    X(:,:,k) = read(validation_set{k});
    D(k,:) = real_data(validation_set{k});

end

%---------------------------------------------------------------%


Y = rand(10,1); %define a shape for Y (10x1)
Y(:,1) = [];    %empty Y

N=length(validation_set'); %number of inputs
for k = 1:N
    x = reshape(X(:,:,k),15,1);
    v1 = W1*x + b1;
    y1 = Sigmoid(v1);
    v2 = W2*y1 + b2;
    y2 = Sigmoid(v2);
    v = W3*y2 +b3;
    y = Softmax(v);
    Y = [Y y];
end
l = 0;

for k = 1:length(validation_set')
    fprintf('validation_set{%d} =', k);
    [Y(:,k) D(k,:)']    
    j = 0;
    for i = 1:10 
        if any( abs(Y(i,k,1) - D(k,i)) > 0.5 )
            j = j+1;
        end 
    end
    if j >= 1
                fprintf('Failure for data %d \n ',k);
                l = l+1;                
    end
    disp(l)   
end
