# Getting and Cleaning Data - Course Project

This is the project for the Getting and Cleaning Data Coursera course.
The R script, `run_analysis.R`, does the following:

1. Download the dataset into the working directory
2. Load activity and feature info
3. Loads  the training and test datasets, save records that are mean or standard deviation
4. Loads the activity and subject data from training and test then merges with  dataset
5. Bring together both datasets
6. Converts activies and subjects  factors
7. Creates a clean dataset is all the average (mean) value of each
   variable for each subject + activity pair.

write this to a file called finalDataset.txt.