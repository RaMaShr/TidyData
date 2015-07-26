This repo contains a script to analyze and summerise the mean and standard deviation measurements in the HAR data by subject and activity, for the entire data set. The HAR data set can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, and will need to be in a folder named "HAR data" in your working directory to work

The script is commented, but follows the following steps

1- Reads in activity and feature lables
2- Reads in training dataset
3- Reads in testing dataset
4- Merges training and testing dataset
5- Adds descriptive column names from feature labels
6- Add descriptive activity names from activity labels
7- Merges training and test sets
8- Extracts features relating to mean and standard deviation of measurements
9- Creates table summerising above data by subject and activity