# TidyData

#Input: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Output: Tidy data set file: Tidy_Output_Set.csv

#Steps followed in the runAnalysis.r file are as follows

1) Check if raw data file has been downloaded and extracted already else download and extract it 
2) Read feature, activity label file in the variables features, activity_label respectively and add legible column names
3) Read Test and Train tables in respective variables 
4) Column bind test variables and Train variables separately 
5) Merge them based on common column names
6) Rename variable names based on features info file
7) Create a new dataset with averages of all variables for all activities and subjects
8) Write the final tidy set in a file Tidy_Output_Set.csv
