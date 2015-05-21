This is the matlab source code of the paper 'A Multiscale and Blind Forensic Technique for Median Detecting'.
If you are using this code, please cite our paper:

[1] Ferreira, Anselmo and Rocha, Anderson. A Multiscale and Blind Forensic Technique for Median Detecting. Proceedings
of the XIX Iberoamerican Congress on Pattern Recognition (CIARP). Puerto Vallarta, Mexico. 2014.

You can find here the matlab source code of three variations of our proposed technique:

* TPOW (Three Perturbations, One Window): This approach yields a feature vector of image quality measures calculated after three
image prturbations with median filterings using 3x3 mask sizes.

* TPMW (Three Perturbations, Multiple Windows): This approach yields a feature vector of image quality measures calculated after three
image prturbations with median filterings using 3x3, 5x5, 7x7 and 9x9 mask sizes.

* FPMW (Three Perturbations, Multiple Windows): This approach yields a feature vector of image quality measures calculated after three
image prturbations with median filterings using 3x3, 5x5, 7x7 and 9x9 mask sizes.

USAGE: chosen_method(image_name, class, feat_vec_file_name).

does our proposed Three Perturbations Multiple Window blind forensic technique on image_name of class 
class (-1 for pristine or 1 for median filtered image) and saves the feature vector in feat_vec_file_name.
If you are training the classifier, the argument class must be known and correctly given by you. 
If you are testing the sample, you can put 0 or any other value here.

We used Libsvm 3.17 for training and testing of the classifier. You can use any other, such as the stats matlab svm.

Please let us know if the code is not running or if you find something in the code.

contact: anselmoferreira@ic.unicamp.br