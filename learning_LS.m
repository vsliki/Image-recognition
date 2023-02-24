function [W1LS, W2LS, W3LS, b1LS, b2LS, b3LS, eLS] = learning_LS(W1LS, W2LS, W3LS, b1LS, b2LS, b3LS, X, D)
variables; %defining alpha
    %error added for plotting
   
    N = size(X,3); %nb of digits. this parameter is not to be changed.
    for k = 1:N
        x = reshape(X(:,:,k),15,1);         %reshapes one of the Xmatrices into an array 15x1
        d = D(k,:)';

        %FORWARD PROPAGATION
        v1 = W1LS*x + b1LS;      %compute output of nodes at input layer
        y1 = Sigmoid(v1);   %compute the activation function between input and 1st hidden layer
    
        v2 = W2LS*y1 + b2LS;     %compute output of nodes at 1st hidden layer
        y2 = Sigmoid(v2);    %compute the activation function between hidden layers

        v = W3LS*y2 + b3LS;      %compute output of nodes at 2nd hidden layer
        y = Softmax(v);     %compute activation function between 2nd hidden and output layer



        %BACK PROP ERRORS
        eLS = d-y;        %error at output
        delta = y.*(1-y).*eLS;      %least square derived learning yields this delta

        e2 = W3LS'*delta;     %error at 2nd hidden layer
        delta2 = y2.*(1-y2).*e2;    %computing the back propagation with general delta rule

        e1 = W2LS'* delta2;
        delta1 = y1.*(1-y1).*e1;

        %updtaing weight matrices witgh SGD
        dW1LS = a*delta1*x'; 
        W1LS = W1LS + dW1LS;
        dW2LS = a * delta2 *y1';
        W2LS = W2LS + dW2LS;
        dW3LS = a * delta *y2';
        W3LS = W3LS + dW3LS;
        
        %updating bias matrices with SGD 
        db1LS = a * delta1;
        b1LS = b1LS + db1LS;
        db2LS = a * delta2;
        b2LS = b2LS + db2LS;
        db3LS = a * delta;
        b3LS = b3LS + db3LS;
    end
end