function [temp_vec]= calculate_IQMs(origImg, distImg)

%If the input image is rgb, convert it to gray image
noOfDim = ndims(origImg);

if(noOfDim == 3)
    origImg = rgb2gray(origImg);
end

%If the distorted image is rgb, convert it to gray image

noOfDim = ndims(distImg);

if(noOfDim == 3)
    distImg = rgb2gray(distImg);
end

%Size Validation
origSiz = size(origImg);
distSiz = size(distImg);

sizErr = isequal(origSiz, distSiz);

if(sizErr == 0)
    disp('Error: Original Image & Distorted Image should be of same dimensions');
    return;
end

temp_vec=zeros(1,8);

%Mean Square Error 
MSE = MeanSquareError(origImg, distImg);
temp_vec(1)=MSE;

%Peak Signal to Noise Ratio 
PSNR = PeakSignaltoNoiseRatio(origImg, distImg);
temp_vec(2)=PSNR;

%Normalized Cross-Correlation 
NK = NormalizedCrossCorrelation(origImg, distImg);
temp_vec(3)=NK;

%Average Difference 
AD = AverageDifference(origImg, distImg);
temp_vec(4)=AD;

%Structural Content 
SC = StructuralContent(origImg, distImg);
temp_vec(5)=SC;

%Maximum Difference 
MD = MaximumDifference(origImg, distImg);
temp_vec(6)=MD;

%Normalized Absolute Error
NAE = NormalizedAbsoluteError(origImg, distImg);
temp_vec(7)=NAE;

%Structural Similarity
SSIM=StructuralSimilarity(origImg, distImg);
temp_vec(8)=SSIM;
