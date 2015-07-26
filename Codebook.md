# Introduction

Course Project

Human Activity Recognition Using Smartphones Dataset [1]

Source Experiment & Data Set

The source data set represents data collected from the accelerometers from the Samsung Galaxy S smartphone. The data set archive can be downloaded from:

Data Set URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


Source Files

The source files we use to create the tidy data set from the extrated data archive are:

features_info.txt: Shows information about the variables used on the feature vector.
features.txt: List of all features.
activity_labels.txt: Links the class labels with their activity name.
train/X_train.txt: Training set.
train/y_train.txt: Training labels.
test/X_test.txt: Test set.
test/y_test.txt: Test labels.
The following files are available for the train and test data. Their descriptions are equivalent.

train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
NOTE: We do not use the Inertial Signals for this tidy data set.

Variables

Variables within the tidy data set are as examined as follows (taken from [1]).

The activity labels consist of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

The subjects who carried out the experiment are represented as a number from 1 to 30.

In order to provide more clarity, the data variable names were changed to the following 

  colNames[i] = gsub("\\()","",colNames[i])
  colNames[i] = gsub("-std$","StdDev",colNames[i])
  colNames[i] = gsub("-mean","Mean",colNames[i])
  colNames[i] = gsub("^(t)","time",colNames[i])
  colNames[i] = gsub("^(f)","freq",colNames[i])
  colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
  colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
  colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
  colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
  colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
  colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
  colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
};
Signals were used to estimate variables of the feature vector for each pattern: '*_[XYZ]$' is used to denote 3-axial signals in the X, Y and Z directions.

For each measurement the mean, stddev, and mean frequency were calculated.


#Transformations


Training and test data set rows were appended and numeric activity values were replaced with descriptive ones. 

Measurements were extracted for mean, standard deviation for each measurement.

variable/column names were labeled with descriptive cleaner names.

Results were output as an indepenent tidy data set at ./data/TidyDataSet.txt

