## Code Book
========================================================


### Variable Information

### Feature Selection from raw data set 

The following verbiage is taken directly from the original experiment described in the README.md file and is provided as back ground on the raw data set and the transformations of that data in the original experiment:

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 

(Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'"

### Feature selection for the run_analysis.R script

The featuress that were selected for summarization were all features that contained the words "mean" and "std" (capitalized or lower case) in their feature title. 

### Summary Information

The "raw" data was taken from Human
Activity Recognition Data Set which can be found at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data was collected from cell phone accelerometer and gyroscope telemetry from 30 subjects.  Telemetry was obtained on six different activities, specifically whether the subject was:

* walking

* walking upstairs

* walking downstairs

* sitting

* standing, and

* laying

The R script file run_analysis combines the 30 subjects, the activities and obtains the average of the mean and standard deviation of the feature set of the raw data files.

### Experimental and Study Design

Six data files from the "Human Activity Recognition Data Set" were read and transformed as follows:

* read following txt files: X_test, X_train, y_test, t_train, subject_test, subject_train, and features

* illegal and style characters are removed from the features.txt file; this file contains the labels for the features contained in the X_test and X_train text files.  Note: capitalized characters were not removed from the labels to aid readability.

* X_train and X_test files contain the numerical data collected from the cell phones for each activity of the six activities.  These two files were combined into one large data frame containing 10,299 observations called combined.data.

* The feature lables were attached to the appropriate feature in the combined.data data frame.

* Once the labels were attached the mean and standard deviation features were selected and placed in two data frames (mean.data and stdev.data) that were then combined into one data frame (mean.std)

* The activity (y_test, y_train) were combined and descriptive names were given to each activity.  The activities in the original files had numerical lavels (1 - 6).  These were lableled: walking, walking_upstairs, walking_downstairs, sitting, standing, and laying respectively.  Once the activities were relabeled they were attached to mean.std data frame thus labeling each telemetric reading with its respective activity.

* The subject id was then attached to the mean.std data frame.  Once this step is completed mean.std data frame contains descriptive labels of the activity, the subject associated with the activity and the mean and standard deviation of the telemetric data from the subjects cell phone.

* The subject id and activity labels were factorized in preparation for the final summarization step.  The mean of each telemetric reading was taken and summarized by subject and activity.  The resulting data frame contained 180 observations and 81 averaged telemetric variables was written to a txt file called summaryMeans.txt.

