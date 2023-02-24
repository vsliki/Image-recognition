%creating a script that sets the training set as 75% of all non-balanced
%data.

variables;
generate_csv;
data_info = dir('data\all_data\');


% creates list 1 x training_number with the name of each file for each data
% %NB: element 1 = '.' et element 2 = '..'
% \times nb_classes because we have 45 sorts of numbers that are trained training_number times.
indice = training_number*nb_class + 2;
list = [];
for k = 3 : indice
    list{end + 1} = data_info(k).name;
end
 

%separates the list in random elements 
% - training = 75% of the dataset
% - validation = 25% remaining
size_training = 3/4 * length(list);
msize = numel(list);
idx = randperm(msize);

%--------------------------------------------------------------------------&
%separating data:
training_set = list(idx(1:size_training));
validation_set = list(idx(size_training + 1:length(list)));





