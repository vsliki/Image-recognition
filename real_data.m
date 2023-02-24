%Function that takes a csv file in input and returns the class
%corresponding to the number represented in this file.

function D = real_data(file)

numbers;
    s1 = 'H:\MATLAB\TravailMaster\MyCode\data\all_data\';
    s = strcat(s1,file);
    K = csvread(s);
    D = K(:,[4 5 6]);

    if isequal(D,mat0)||isequal(D,mat01)||isequal(D, mat02)||isequal(D,mat03)
    D = [0 0 0 0 0 0 0 0 0 1];

    elseif isequal(D,mat1)||isequal(D,mat11)||isequal(D,mat12)||isequal(D, mat13)||isequal(D,mat14)
    D = [1 0 0 0 0 0 0 0 0 0];

    elseif isequal(D,mat2)||isequal(D,mat21)||isequal(D,mat22)||isequal(D, mat23)
    D = [0 1 0 0 0 0 0 0 0 0];
    
    elseif isequal(D,mat3)||isequal(D,mat31)||isequal(D,mat32)||isequal(D, mat33)||isequal(D,mat34)
    D = [0 0 1 0 0 0 0 0 0 0];

    elseif isequal(D,mat4)||isequal(D,mat41)||isequal(D,mat42)||isequal(D, mat43)
    D = [0 0 0 1 0 0 0 0 0 0];

    elseif isequal(D,mat5)||isequal(D,mat51)||isequal(D,mat52)||isequal(D, mat53)
    D = [0 0 0 0 1 0 0 0 0 0];

    elseif isequal(D,mat6)||isequal(D,mat61)||isequal(D,mat62)||isequal(D, mat63)||isequal(D,mat64)
    D = [0 0 0 0 0 1 0 0 0 0];

    elseif isequal(D,mat7)||isequal(D,mat71)||isequal(D,mat72)||isequal(D, mat73)
    D = [0 0 0 0 0 0 1 0 0 0];

    elseif isequal(D,mat8)||isequal(D,mat81)||isequal(D,mat82)||isequal(D, mat83)
    D = [0 0 0 0 0 0 0 1 0 0];

    elseif isequal(D,mat9)||isequal(D,mat91)||isequal(D,mat92)||isequal(D, mat93)||isequal(D,mat94)||isequal(D,mat95)
    D = [0 0 0 0 0 0 0 0 1 0];
    
    else
    disp('erreur de classification')

    end
end
%extra data: 
%     elseif D == mat01
%     D = [0 0 0 0 0 0 0 0 0 1];
%     elseif D == mat02
%     D = [0 0 0 0 0 0 0 0 0 1];              %0
%     elseif D == mat03
%     D = [0 0 0 0 0 0 0 0 0 1];
% 
%     elseif D == mat11
%     D = [1 0 0 0 0 0 0 0 0 0];    
%     elseif D == mat12
%     D = [1 0 0 0 0 0 0 0 0 0];
%     elseif D == mat13                       %1
%     D = [1 0 0 0 0 0 0 0 0 0];    
%     elseif D == mat14
%     D = [1 0 0 0 0 0 0 0 0 0];    

%     elseif D == mat21 
%     D = [0 1 0 0 0 0 0 0 0 0];
%     elseif D == mat22
%     D = [0 1 0 0 0 0 0 0 0 0];              %2
%     elseif D == mat23
%     D = [0 1 0 0 0 0 0 0 0 0];

%     elseif D == mat31 
%     D = [0 0 1 0 0 0 0 0 0 0];
%     elseif D == mat32
%     D = [0 0 1 0 0 0 0 0 0 0];
%     elseif D == mat33                       %3
%     D = [0 0 1 0 0 0 0 0 0 0];
%     elseif D == mat34
%     D = [0 0 1 0 0 0 0 0 0 0];

%     elseif D == mat41 
%     D = [0 0 0 1 0 0 0 0 0 0];
%     elseif D == mat42
%     D = [0 0 0 1 0 0 0 0 0 0];              %4
%     elseif D == mat43
%     D = [0 0 0 1 0 0 0 0 0 0];
% 
%     elseif D == mat51 
%     D = [0 0 0 0 1 0 0 0 0 0];
%     elseif D == mat52
%     D = [0 0 0 0 1 0 0 0 0 0];              %5
%     elseif D == mat53
%     D = [0 0 0 0 1 0 0 0 0 0];
% 
%     elseif D == mat61 
%     D = [0 0 0 0 0 1 0 0 0 0];
%     elseif D == mat62
%     D = [0 0 0 0 0 1 0 0 0 0];
%     elseif D == mat63                       %6
%     D = [0 0 0 0 0 1 0 0 0 0];
%     elseif D == mat64
%     D = [0 0 0 0 0 1 0 0 0 0];
% 
%     elseif D == mat71 
%     D = [0 0 0 0 0 0 1 0 0 0];
%     elseif D == mat72
%     D = [0 0 0 0 0 0 1 0 0 0];              %7
%     elseif D == mat73
%     D = [0 0 0 0 0 0 1 0 0 0];
% 
%     elseif D == mat81 
%     D = [0 0 0 0 0 0 0 1 0 0];
%     elseif D == mat82
%     D = [0 0 0 0 0 0 0 1 0 0];              %8
%     elseif D == mat83
%     D = [0 0 0 0 0 0 0 1 0 0];
% 
%     elseif D == mat91
%     D = [0 0 0 0 0 0 0 0 1 0];
%     elseif D == mat92
%     D = [0 0 0 0 0 0 0 0 1 0];
%     elseif D == mat93
%     D = [0 0 0 0 0 0 0 0 1 0];              %9
%     elseif D == mat94
%     D = [0 0 0 0 0 0 0 0 1 0];
%     else
%     D = [0 0 0 0 0 0 0 0 1 0];
% 
%     end

