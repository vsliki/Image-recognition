%script that generates csv files of the form: 54file3.csv for example
%csv contains the matrix 54 with noise + matrix 54 without noise and is the
%3rd sample of this matrix. 

numbers;
variables;

matrices = {mat0 mat01 mat02 mat03 mat1 mat11 mat12 mat13 mat14 mat2 mat21 mat22 mat23 mat3 mat31 mat32 mat33 mat34 mat4 mat41 mat42 mat43 mat5 mat51 mat52 mat53 mat6 mat61 mat62 mat63 mat64 mat7 mat71 mat72 mat73 mat8 mat81 mat82 mat83 mat9 mat91 mat92 mat93 mat94 mat95};
classe = ["0" "01" "02" "03" "1" "11" "12" "13" "14" "2", "21", "22", "23","3", "31", "32", "33", "34", "4", "41", "42", "43", "5", "51", "52", "53", "6", "61", "62" "63", "64", "7", "71", "72", "73", "8", "81", "82", "83", "9", "91", "92", "93", "94", "95"];

  for i = 1:training_number
      for k = 1:length(classe)
          num = classe(k);
          pert = pert_mat(matrices{k});
          %s1 = 'H:\MATLAB\TravailMaster\MyCode\data\ ';
          s2 = num;
          %s3 = '\';
          s4 = 'file';
          s5 = string(i);
          s6 = '.csv';
          %s = strcat(s1,s2,s3,s2,s4,s5,s6);
          %csvwrite(s,[pert matrices{k}]);

          s8 =  'H:\MATLAB\TravailMaster\MyCode\data\all_data\';
          s11 = strcat(s8,s2,s4,s5,s6);
          csvwrite(s11,[pert matrices{k}]);
      end
  end


