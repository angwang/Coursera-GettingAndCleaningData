==================================================================
Data derived from the Human Activity Recognition Using
Smartphones Dataset Version 1.0
==================================================================

Coursera  Getting and Cleaning Data Project
==================================================================
July 26, 2014
Data was obtained from the UCI HAR Dataset at the website:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Its embedded accelerometer and gyroscope, captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.For this data set, we combine the measurements for the test and training group.

The sensor signals (accelerometer and gyroscope) have been pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal,which had gravitational and body motion, was separated into body acceleration and gravity components. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. For this data set we calculated the average of those features that are the mean and standard deviation of the signal features. The other characteristics, such as max, min, energy, etc, are not considered here. See UCI HAR Dataset �features_info.txt' for more details. 

Data from test and training subjects from the UCI HAR dataset are combined to obtain a total of 30 subjects.

For each record it is provided:
======================================

- An identifier of the subject who carried out the experiment.
- Type of activity performed
- The average of 79 features vector. These features include time and frequency domain variables, which have the mean and standard deviation calculated. 

The dataset includes the following files:
=========================================

- 'README.txt'

- �Codebook.txt': Contains information about the variables used in the feature vector.

- 'run_analysis.R': R script for creating the tidy data set

- 'AverageActivityMeasurements.csv': The tidy data set, with comma separated values


This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
