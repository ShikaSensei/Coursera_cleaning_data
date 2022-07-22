# Importing and cleaning data
Programming assignment for Coursera [Getting and Cleaning Data course](https://www.coursera.org/learn/data-cleaning/home/week/4) from Johns Hopkins University.

It uses [UCI HAR Dataset](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## run_analysis.R

R script run_analysis.R does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

It saves the full wide dataset to full_dataset.txt and summarised dataset to summarised_dataset.txt

R package requirements are reshape2 and dplyr.

I am planing to do this programming assignment in Python in near future.

## CodeBook.md

CodeBook.md describes the variables, the data and every step performed to import, clean and transform the original data.
