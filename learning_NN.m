function [W1, W2, W3, b1, b2, b3, e] = learning_NN(W1, W2, W3, b1, b2, b3, X, D)
variables; %defining alpha;

   
    N = size(X,3); %nb of digits. this parameter is not to be changed.
    for k = 1:N
        x = reshape(X(:,:,k),15,1); %reshapes one of the Xmatrices into an array 15x1
        d = D(k,:)';

        %FORWARD PROPAGATION
        v1 = W1*x + b1;      %compute output of nodes at input layer
        y1 = Sigmoid(v1);   %compute the activation function between input and 1st hidden layer
    
        v2 = W2*y1 + b2;     %compute output of nodes at 1st hidden layer
        y2 = Sigmoid(v2);    %compute the activation function between hidden layers

        v = W3*y2 + b3;      %compute output of nodes at 2nd hidden layer
        y = Softmax(v);     %compute activation function between 2nd hidden and output layer



        %BACK PROP ERRORS
        e = d-y;        %error at output
        delta = d-y;      %cross-entropy derived learning yields delta = e

        e2 = W3'*delta;     %error at 2nd hidden layer
        delta2 = e2.*y2.*(1-y2);    %computing the back propagation with general delta rule

        e1 = W2'* delta2;
        delta1 = e1.*y1.*(1-y1);

        %updtaing weight matrices with SGD
        dW1 = a*delta1*x'; 
        W1 = W1 + dW1;
        dW2 = a * delta2 *y1';
        W2 = W2 + dW2;
        dW3 = a * delta *y2';
        W3 = W3 + dW3;
        
        %updating bias matrices with SGD 
        db1 = a * delta1;
        b1 = b1 + db1;
        db2 = a * delta2;
        b2 = b2 + db2;
        db3 = a * delta;
        b3 = b3 + db3;
    end
end