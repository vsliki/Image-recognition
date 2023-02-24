%import useful scripts
variables;
separate_data;
numbers;

%setting the inputs: training_set
N = length(training_set');
for k = 1: N
     X(:,:,k) = read(training_set{k});
     D(k,:) = real_data(training_set{k});
end


%weights and biases
b1 = 2*rand(30,1) -1;
b2 = 2*rand(20,1) -1;
b3 = 2*rand(10,1) -1;
W1 = 2*rand(30,15) -1 ;  %weight matrix between input layer and 1st hidden layer
W2 = 2*rand(20,30) -1 ;  %weight matrix between 1st hidden layer and 2nd hidden layer
W3 = 2*rand(10,20) -1 ;  %weight matrix between 2nd hidden layer and output layer

b1LS = b1;
b2LS = b2;
b3LS = b3;
W1LS = W1;
W2LS = W2;
W3LS = W3;


%--------------------------------------------------------------%
%training of the network

for k = 1:epoch
    [W1LS, W2LS, W3LS, b1LS, b2LS, b3LS, eLS] = learning_LS(W1LS, W2LS, W3LS, b1LS, b2LS, b3LS, X, D);
    [W1, W2, W3, b1, b2, b3, e] = learning_NN(W1, W2, W3, b1, b2, b3, X, D);

    it(k) = k;
    errorCE(k) = norm(e);
    errorLS(k) = norm(eLS);


end

 


 semilogy(it,errorCE)
 hold on
 semilogy(it,errorLS)
 hold on

 ylabel('Error of the network')
 xlabel('Epoch')
 legend('Cross Entropy', 'Sum of Squares Errors')
