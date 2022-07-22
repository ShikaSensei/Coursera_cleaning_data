# Human Activity Recognition Using Smartphones Dataset

## Sources

Dataset for this project was downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). It was obtained from [UCI ML Repository](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), original documentation is available there.

## Dataset information

The data was collected from the sensors of the Samsung Galaxy S smartphone the experiment. It have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Data Manipulation

### Importing Data

Before reading any of the datasets we need to load the following complimentary information:

0.1 descriptive activity names form 'UCI HAR Dataset/activity_labels.txt'
0.2. variables' names form "UCI HAR Dataset/features_info.txt"

#### Training Dataset

Steps taken to import the training dataset ('UCI HAR Dataset/train'):

1. read variables form 'X_train.txt'
2. read activity column from 'y_train.txt'
3. read subject_id column from 'subject_train.txt'
4. merge activity column (2) with data frame with activity names data frame (0.1) to get column with descriptive activity names
5. combine subject_id column (3), descriptive activity column (4) and variables data frame (1) column wise
6. give columns of resulting dataset (5) descriptive names: 'subject_id', 'activity' and previously imported variable names (0.2)

#### Testing Dataset

Steps taken to import the training dataset ('UCI HAR Dataset/test'):

1. read variables form 'X_test.txt'
2. read activity column from 'y_test.txt'
3. read subject_id column from 'subject_test.txt'
4. merge activity column (2) with data frame with activity names data frame (0.1) to get column with descriptive activity names
5. combine subject_id column (3), descriptive activity column (4) and variables data frame (1) column wise
6. give columns of resulting dataset (5) descriptive names: 'subject_id', 'activity' and previously imported variable names (0.2)

### Cleaning Data

1. stack training and testing datasets
2. select variables with mean and standard deviation measurements, 'mean()' and 'std()' in variable names respectively.
3. clean variable names:
    - delete '()'
    - substitute '-' for '_'
    
    Varying case and '_' are used to enhance the human readability of the names

### Reshaping and Transformation

1. Reshape the dataset to a long format: subject_id and activity are id columns
2. Summarise data to show the average of each variable for each activity and each subject.

### Saving data

1. Resulted tidy and filtered wide dataset is saved to 'full_dataset.csv'
2. Summirised tidy dataset is saved to 'summarised_dataset.csv'


## Data Description

### full_dataset.csv

The dataset consists of 68 columns:

1. *subject_id*

   ID of the subject
2. *activity*

   Name of the corresponding activity. Permitted values are:
   - WALKING
   - WALKING_UPSTAIRS
   - WALKING_DOWNSTAIRS
   - SITTING
   - STANDING
   
Descriptions for following values are available in 'UCI HAR Dataset/features_info.txt'

3. *tBodyAcc_mean_X*
4. *tBodyAcc_mean_Y*
5. *tBodyAcc_mean_Z*
6. *tBodyAcc_std_X*
7. *tBodyAcc_std_Y*
8. *tBodyAcc_std_Z*
9. *tGravityAcc_mean_X*
10. *tGravityAcc_mean_Y*
11. *tGravityAcc_mean_Z*
12. *tGravityAcc_std_X*
13. *tGravityAcc_std_Y*
14. *tGravityAcc_std_Z*
15. *tBodyAccJerk_mean_X*
16. *tBodyAccJerk_mean_Y*
17. *tBodyAccJerk_mean_Z*
18. *tBodyAccJerk_std_X*
19. *tBodyAccJerk_std_Y*
20. *tBodyAccJerk_std_Z*
21. *tBodyGyro_mean_X*
22. *tBodyGyro_mean_Y*
23. *tBodyGyro_mean_Z*
24. *tBodyGyro_std_X*
25. *tBodyGyro_std_Y*
26. *tBodyGyro_std_Z*
27. *tBodyGyroJerk_mean_X*
28. *tBodyGyroJerk_mean_Y*
29. *tBodyGyroJerk_mean_Z*
30. *tBodyGyroJerk_std_X*
31. *tBodyGyroJerk_std_Y*
32. *tBodyGyroJerk_std_Z*
33. *tBodyAccMag_mean*
34. *tBodyAccMag_std*
35. *tGravityAccMag_mean*
36. *tGravityAccMag_std*
37. *tBodyAccJerkMag_mean*
38. *tBodyAccJerkMag_std*
39. *tBodyGyroMag_mean*
40. *tBodyGyroMag_std*
41. *tBodyGyroJerkMag_mean*
42. *tBodyGyroJerkMag_std*
43. *fBodyAcc_mean_X*
44. *fBodyAcc_mean_Y*
45. *fBodyAcc_mean_Z*
46. *fBodyAcc_std_X*
47. *fBodyAcc_std_Y*
48. *fBodyAcc_std_Z*
49. *fBodyAccJerk_mean_X*
50. *fBodyAccJerk_mean_Y*
51. *fBodyAccJerk_mean_Z*
52. *fBodyAccJerk_std_X*
53. *fBodyAccJerk_std_Y*
54. *fBodyAccJerk_std_Z*
55. *fBodyGyro_mean_X*
56. *fBodyGyro_mean_Y*
57. *fBodyGyro_mean_Z*
58. *fBodyGyro_std_X*
59. *fBodyGyro_std_Y*
60. *fBodyGyro_std_Z*
61. *fBodyAccMag_mean*
62. *fBodyAccMag_std*
63. *fBodyBodyAccJerkMag_mean*
64. *fBodyBodyAccJerkMag_std*
65. *fBodyBodyGyroMag_mean*
66. *fBodyBodyGyroMag_std*
67. *fBodyBodyGyroJerkMag_mean*
68. *fBodyBodyGyroJerkMag_std*

### summarised_dataset.csv

Contains summarised data, showing the average of each variable for each activity and each subject. The dataset contains 4 columns:

1. *subject_id*

   ID of the subject
2. *activity*

   Name of the corresponding activity. Permitted values are:
   - WALKING
   - WALKING_UPSTAIRS
   - WALKING_DOWNSTAIRS
   - SITTING
   - STANDING
3. *variable*

    name of measurement feature, extensive list can be found in 'UCI HAR Dataset/features_info.txt'
   
4. *average*

    the average of each variable for each activity and each subject