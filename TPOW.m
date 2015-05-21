% This function extracts the feature vector for our proposed multiple perturbation and 
% multiscale median filtering detection.
% If you are using this code, please cite our paper
% [1] FERREIRA, Anselmo and ROCHA, Anderson. A Multiscale and Blind Forensic Technique for Median 
% Detecting. XIX Iberoamerican Congress On Pattern Recognition. Puerto Vallarta, Mexico. 2014.

%USAGE: TPOW(image_name, class, feat_vec_file_name).
%does our proposed Three Perturbations with One Window blind forensic technique on imageage_name of class 
%class (-1 for pristine or 1 for median filtered imageage) and saves the feature vector in feat_vec_file_name.
%If you are training the classifier, the argument class must be known and correctly given by you. 
%If you are testing the sample, you can put 0 or any other value here.

function TPOW(image_name, class, feat_vec_file_name)

addpath('IQMS');
%first, the image is read
image=imread(image_name);

%When doing 3 perturbations with 1 different window sizes and calculating 8 different
%image quality measures per perturbation, the final feature vector of IQMs has 3x1x8=24 dimensions.
feat_vec=zeros(1,25);	

%the extra dimension here (the first) is for the class of the sample. If you are training the classifier, 
%the class must be known. If you are testing the sample, you can put 0 here.
feat_vec(1)=class;	

%Now, we are going to start the perturbations!
%First, the image is progressively blurred three times with a 3x3 window%%%%%%%%%%%%%%%%%%%%%%%%%%
%at each blurry, the blurred image is compared to the input image by means of image quality metrics.
%we use eight image quality metrics in the comparisonH1=[3 3];
blurred_image_1_3x3=medfilt2(image, H1);

[temp_vec]=calculate_IQMs(image, blurred_image_1_3x3);

feat_vec(2)=temp_vec(1);
feat_vec(3)=temp_vec(2);
feat_vec(4)=temp_vec(3);
feat_vec(5)=temp_vec(4);
feat_vec(6)=temp_vec(5);
feat_vec(7)=temp_vec(6);
feat_vec(8)=temp_vec(7);
feat_vec(9)=temp_vec(8);
clear temp_vec;

blurred_image_2_3x3=medfilt2(blurred_image_1_3x3, H1);
[temp_vec]=calculate_IQMs(image, blurred_image_2_3x3);
feat_vec(10)=temp_vec(1);
feat_vec(11)=temp_vec(2);
feat_vec(12)=temp_vec(3);
feat_vec(13)=temp_vec(4);
feat_vec(14)=temp_vec(5);
feat_vec(15)=temp_vec(6);
feat_vec(16)=temp_vec(7);
feat_vec(17)=temp_vec(8);
clear temp_vec;


blurred_image_3_3x3=medfilt2(blurred_image_2_3x3, H1);
[temp_vec]=calculate_IQMs(image, blurred_image_3_3x3);
feat_vec(18)=temp_vec(1);
feat_vec(19)=temp_vec(2);
feat_vec(20)=temp_vec(3);
feat_vec(21)=temp_vec(4);
feat_vec(22)=temp_vec(5);
feat_vec(23)=temp_vec(6);
feat_vec(24)=temp_vec(7);
feat_vec(25)=temp_vec(8);
clear temp_vec;

dlmwrite(feat_vec_file_name, feat_vec, '-append');				


end
