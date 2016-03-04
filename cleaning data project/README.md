---
title: "README"
author: "Hien-Nguyen"
date: "March 4, 2016"
output: html_document
---

* run_analysis.R: script doing the analysis as explained below.
* data1.txt: the whole data combined from train and test sets
* code book.txt: explains variables in data1.txt
* data2.txt: contains the mean for each measure from data1.txt and grouped by subject & activity.name

###-------------------------------
The analysis assumes the data is unziped and available in the folder 
	./UCI HAR Dataset/

The analysis contains steps as followings.

1. Read feature names and activity lables from features.txt, activity_labels.txt
2. Read training and test sets from files 
	subject_train.txt (code of subject), y_train.txt (code of activity), x_train.txt (measures)
	subject_test.txt, y_test.txt, x_test.txt
3. Extract measures estimated with mean and std by looking at the name of the feature
4. Combine training and test sets (including combine rows and columns)
5. Set column names
6. Merge with activity lables to get the label of activity
7. Write the whole data into file "data1.txt"
8. Calculate the mean for each variable grouped by subject and activity
9. Write the mean in step 8 into fiel "data2.txt"
10. Calculate summary (i.e. quantiles) for each numeric measure i.e. variable of columns 4-69 (see "code book.txt")