This is a summary of the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

1. Download the dataset, and load the activity and feature info
2. Merge the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. Use grep command to get column indexes for variable name contains "mean()" or "std()", keeping only those columns which reflect a mean or standard deviation
4. Load the activity and subject data for each dataset, and convert activity labels to characters and add a new column as factor
5. Appropriately label the data set with descriptive variable names. Give the selected descriptive names to variable columns
6. Create a tidy dataset (tidydata.txt) that consists of the average (mean) value of each variable for each subject and activity.
