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

%--------------------------------------------------------------%
%training of the network

for k = 1:epoch
   %[W1LS, W2LS, W3LS, b1LS, b2LS, b3LS, eLS] = learning_LS(W1, W2, W3, b1, b2, b3, X, D);
   [W1, W2, W3, b1, b2, b3, e] = learning_NN(W1, W2, W3, b1, b2, b3, X, D);

    %plotting purposes:
     error(k) = norm(e);
%     errorLS(k) = norm(eLS);
     it(k) = k;
    
end

%plot
% figure 
% hold on
 semilogy(it,error)
% semilogy(it,errorLS)
 ylabel('Error of the network')
 xlabel('Iterations for each data')
% legend('Cross Entropy Error', 'Least Square Error')


%displaying details
Y = rand(10,1); %define a shape for Y (10x1)
Y(:,1) = [];    %empty Y

%N = length(training_set');
for k = 1:N
    x = reshape(X(:,:,k), 15,1);
    v1 = W1*x + b1;
    y1 = Sigmoid(v1);
    v2 = W2*y1 + b2;
    y2 = Sigmoid(v2);
    v = W3*y2 + b3;
    y = Softmax(v);
    Y = [Y y]; %add a new column to Y (For displaying reasons)
end

l = 0;
%display
for k = 1:length(training_set')
    %fprintf('training_set{%d} =', k);
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
    %disp(l)   
end


