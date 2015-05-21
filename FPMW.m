% This function extracts the feature vector for our proposed multiple perturbation and 
% multiscale median filtering detection.
% If you are using this code, please cite our paper
% [1] FERREIRA, Anselmo and ROCHA, Anderson. A Multiscale and Blind Forensic Technique for Median 
% Detecting. XIX Iberoamerican Congress On Pattern Recognition. Puerto Vallarta, Mexico. 2014.

%USAGE: FPMW(image_name, class, feat_vec_file_name).
%does our proposed Four Perturbations Multiple Windows blind forensic technique on image_name of class 
%class (-1 for pristine or 1 for median filtered image) and saves the feature vector in feat_vec_file_name.
%If you are training the classifier, the argument class must be known and correctly given by you. 
%If you are testing the sample, you can put 0 or any other value here.

function FPMW(image_name, class, feat_vec_file_name)

addpath('IQMS');

%first, the image is read
image=imread(image_name);

%When doing 4 perturbations with 4 different window sizes and calculating 8 different
%image quality measures per perturbation, the final feature vector of IQMs has 4x4x8=128 dimensions.
feat_vec=zeros(1,129);		

%the extra dimension here (the first) is for the class of the sample. If you are training the classifier, 
%the class must be known. If you are testing the sample, you can put 0 here.
feat_vec(1)=class;
		
%Now, we are going to start the perturbations!
%First, the image is progressively blurred three times with a 3x3 window%%%%%%%%%%%%%%%%%%%%%%%%%%
%at each blurry, the blurred image is compared to the input image by means of image quality metrics.
%we use eight image quality metrics in the comparison
H1=[3 3];

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

blurred_image_4_3x3=medfilt2(blurred_image_3_3x3, H1);
[temp_vec]=calculate_IQMs(image, blurred_image_4_3x3);
feat_vec(26)=temp_vec(1);
feat_vec(27)=temp_vec(2);
feat_vec(28)=temp_vec(3);
feat_vec(29)=temp_vec(4);
feat_vec(30)=temp_vec(5);
feat_vec(31)=temp_vec(6);
feat_vec(32)=temp_vec(7);
feat_vec(33)=temp_vec(8);
clear temp_vec;

%Now, the image is progressively blurred three times with a 5x5 window%%%%%%%%%%%%%%%%%%%%%%%%%%
%at each blurry, the blurred image is compared to the input image by means of image quality metrics.
%we use eight image quality metrics in the comparison
H2=[5 5];

blurred_image_1_5x5=medfilt2(image, H2);
[temp_vec]=calculate_IQMs(image, blurred_image_1_5x5);
feat_vec(34)=temp_vec(1);
feat_vec(35)=temp_vec(2);
feat_vec(36)=temp_vec(3);
feat_vec(37)=temp_vec(4);
feat_vec(38)=temp_vec(5);
feat_vec(39)=temp_vec(6);
feat_vec(40)=temp_vec(7);
feat_vec(41)=temp_vec(8);
clear temp_vec;

blurred_image_2_5x5=medfilt2(blurred_image_1_5x5, H2);
[temp_vec]=calculate_IQMs(image, blurred_image_2_5x5);
feat_vec(42)=temp_vec(1);
feat_vec(43)=temp_vec(2);
feat_vec(44)=temp_vec(3);
feat_vec(45)=temp_vec(4);
feat_vec(46)=temp_vec(5);
feat_vec(47)=temp_vec(6);
feat_vec(48)=temp_vec(7);
feat_vec(49)=temp_vec(8);
clear temp_vec;


blurred_image_3_5x5=medfilt2(blurred_image_2_5x5, H2);
[temp_vec]=calculate_IQMs(image, blurred_image_3_5x5);
feat_vec(50)=temp_vec(1);
feat_vec(51)=temp_vec(2);
feat_vec(52)=temp_vec(3);
feat_vec(53)=temp_vec(4);
feat_vec(54)=temp_vec(5);
feat_vec(55)=temp_vec(6);
feat_vec(56)=temp_vec(7);
feat_vec(57)=temp_vec(8);
clear temp_vec;

blurred_image_4_5x5=medfilt2(blurred_image_3_5x5, H2);
[temp_vec]=calculate_IQMs(image, blurred_image_4_5x5);
feat_vec(58)=temp_vec(1);
feat_vec(59)=temp_vec(2);
feat_vec(60)=temp_vec(3);
feat_vec(61)=temp_vec(4);
feat_vec(62)=temp_vec(5);
feat_vec(63)=temp_vec(6);
feat_vec(64)=temp_vec(7);
feat_vec(65)=temp_vec(8);
clear temp_vec;

%Now, the image is progressively blurred three times with a 7x7 window%%%%%%%%%%%%%%%%%%%%%%%%%%
%at each blurry, the blurred image is compared to the input image by means of image quality metrics.
%we use eight image quality metrics in the comparison

H3=[7 7];

blurred_image_1_7x7=medfilt2(image, H3);
[temp_vec]=calculate_IQMs(image, blurred_image_1_7x7);
feat_vec(66)=temp_vec(1);
feat_vec(67)=temp_vec(2);
feat_vec(68)=temp_vec(3);
feat_vec(69)=temp_vec(4);
feat_vec(70)=temp_vec(5);
feat_vec(71)=temp_vec(6);
feat_vec(72)=temp_vec(7);
feat_vec(73)=temp_vec(8);
clear temp_vec;

blurred_image_2_7x7=medfilt2(blurred_image_1_7x7, H3);
[temp_vec]=calculate_IQMs(image, blurred_image_2_7x7);
feat_vec(74)=temp_vec(1);
feat_vec(75)=temp_vec(2);
feat_vec(76)=temp_vec(3);
feat_vec(77)=temp_vec(4);
feat_vec(78)=temp_vec(5);
feat_vec(79)=temp_vec(6);
feat_vec(80)=temp_vec(7);
feat_vec(81)=temp_vec(8);
clear temp_vec;

blurred_image_3_7x7=medfilt2(blurred_image_2_7x7, H3);
[temp_vec]=calculate_IQMs(image, blurred_image_3_7x7);
feat_vec(82)=temp_vec(1);
feat_vec(83)=temp_vec(2);
feat_vec(84)=temp_vec(3);
feat_vec(85)=temp_vec(4);
feat_vec(86)=temp_vec(5);
feat_vec(87)=temp_vec(6);
feat_vec(88)=temp_vec(7);
feat_vec(89)=temp_vec(8);
clear temp_vec;

blurred_image_4_7x7=medfilt2(blurred_image_3_7x7, H3);
[temp_vec]=calculate_IQMs(image, blurred_image_4_7x7);
feat_vec(90)=temp_vec(1);
feat_vec(91)=temp_vec(2);
feat_vec(92)=temp_vec(3);
feat_vec(93)=temp_vec(4);
feat_vec(94)=temp_vec(5);
feat_vec(95)=temp_vec(6);
feat_vec(96)=temp_vec(7);
feat_vec(97)=temp_vec(8);
clear temp_vec;

%Now, the image is progressively blurred three times with a 9x9 window%%%%%%%%%%%%%%%%%%%%%%%%%%
%at each blurry, the blurred image is compared to the input image by means of image quality metrics.
%we use eight image quality metrics in the comparison

H4=[9 9];
blurred_image_1_9x9=medfilt2(image, H4);
[temp_vec]=calculate_IQMs(image, blurred_image_1_9x9);
feat_vec(98)=temp_vec(1);
feat_vec(99)=temp_vec(2);
feat_vec(100)=temp_vec(3);
feat_vec(101)=temp_vec(4);
feat_vec(102)=temp_vec(5);
feat_vec(103)=temp_vec(6);
feat_vec(104)=temp_vec(7);
feat_vec(105)=temp_vec(8);
clear temp_vec;

blurred_image_2_9x9=medfilt2(blurred_image_1_9x9, H4);
[temp_vec]=calculate_IQMs(image, blurred_image_2_9x9);
feat_vec(106)=temp_vec(1);
feat_vec(107)=temp_vec(2);
feat_vec(108)=temp_vec(3);
feat_vec(109)=temp_vec(4);
feat_vec(110)=temp_vec(5);
feat_vec(111)=temp_vec(6);
feat_vec(112)=temp_vec(7);
feat_vec(113)=temp_vec(8);
clear temp_vec;

blurred_image_3_9x9=medfilt2(blurred_image_2_9x9, H4);
[temp_vec]=calculate_IQMs(image, blurred_image_3_9x9);
feat_vec(114)=temp_vec(1);
feat_vec(115)=temp_vec(2);
feat_vec(116)=temp_vec(3);
feat_vec(117)=temp_vec(4);
feat_vec(118)=temp_vec(5);
feat_vec(119)=temp_vec(6);
feat_vec(120)=temp_vec(7);
feat_vec(121)=temp_vec(8);
clear temp_vec;

blurred_image_4_9x9=medfilt2(blurred_image_3_9x9, H4);
[temp_vec]=calculate_IQMs(image, blurred_image_4_9x9);
feat_vec(122)=temp_vec(1);
feat_vec(123)=temp_vec(2);
feat_vec(124)=temp_vec(3);
feat_vec(125)=temp_vec(4);
feat_vec(126)=temp_vec(5);
feat_vec(127)=temp_vec(6);
feat_vec(128)=temp_vec(7);
feat_vec(129)=temp_vec(8);
clear temp_vec;

dlmwrite(feat_vec_file_name, feat_vec, '-append');				

end
