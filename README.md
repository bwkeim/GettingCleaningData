==================================================================
## Summary and mean data of Human Activity Recognition Using 
## Smartphones Dataset Version 1.0
==================================================================

Summary mean data set was created by Bernie Keim for Coursera's
Getting and Cleaning Data course


Human Activity Recognition Data Set was created by:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

==================================================================



This R-script takes data created in the Human
Activity Recognition Data Set; the original data set can be found at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The raw data set was taken from smart phones with inertial sensors worn
by 30 subjects.  The data was summarized in various ways -- see 
the README.txt at the UCI repository (above link) to see how the data was transformed.

The transformed data was used as the raw data for the summary mean data created 
by this R script.

===================================================================

The raw data is contained in 7 txt files (X_test, X_train, y_test, 
y_train, subject_train, subject_test, and features).  These 7 files 
were transformed into the final file SummaryMeants.txt.  The 
SummaryMeans.txt file contains mean data on mean and standard 
deviation variables from the X_test and X_train data files.  
The variable means were summarized by subject and by activity 
giving a final data set that has 180 observations and 81 variables.

===================================================================

The data set includes the following files:

* 'README.md'

* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.

* 'X_train.txt': Training set.

* 'y_train.txt': Training labels.

* 'X_test.txt': Test set.

* 'y_test.txt': Test labels.

* 'SummaryMeans.txt': Summary data file.

* 'run_analysis.R': R script file used to create SummaryMeans.txt.

* 'CodeBook.md': Code book describing files and methodologies.

### License:
========

The underlying raw data was based on and is attributed to: 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
