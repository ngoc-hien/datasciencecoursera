---
title: "CodeBook"
author: "Hien-Nguyen"
date: "March 4, 2016"
output: html_document
---

* This CodeBook explains the data in file "data1.txt"
* File "data2.txt" contains the average for each measurement in "data1.txt" and for each group of subject&activity

=================
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

These signals were calculated in mean and standard deviation: 

* mean(): Mean value
* std(): Standard deviation

=====================
code book for the whole data set in data1.txt
=====================

There are 10299 obs. of  69 variables:

 1. subject                    : int  
	there are 30 subjects with id from 1 to 30
 2. activity.code              : int   
 3. activity.name              : characters
	code 	name
	* 1 		WALKING
	* 2 		WALKING_UPSTAIRS
	* 3 		WALKING_DOWNSTAIRS
	* 4 		SITTING
	* 5 		STANDING
	* 6 		LAYING
 
 * variables 4-69 with summary about quantile 0%, 25%, 50%, 75%, 100%
4. tBodyAcc-mean()-X           -1  \t0.26262480  \t0.277173880  \t0.28835422    \t1
5. tBodyAcc-mean()-Y           -1 -0.02490248 -0.017161624 -0.01062456    1
6. tBodyAcc-mean()-Z           -1 -0.12101888 -0.108596420 -0.09758935    1
7. tBodyAcc-std()-X            -1 -0.99236049 -0.943030030 -0.25029286    1
8. tBodyAcc-std()-Y            -1 -0.97699023 -0.835031930 -0.05733557    1
9. tBodyAcc-std()-Z            -1 -0.97913693 -0.850772950 -0.27873736    1
10. tGravityAcc-mean()-X        -1  0.81173988  0.921793070  0.95466670    1
11. tGravityAcc-mean()-Y        -1 -0.24294327 -0.143551240  0.11890457    1
12. tGravityAcc-mean()-Z        -1 -0.11671450  0.036801050  0.21620587    1
13. tGravityAcc-std()-X         -1 -0.99494545 -0.981852530 -0.96153450    1
14. tGravityAcc-std()-Y         -1 -0.99129917 -0.975876630 -0.94642926    1
15. tGravityAcc-std()-Z         -1 -0.98658148 -0.966544460 -0.92957037    1
16. tBodyAccJerk-mean()-X       -1  0.06298048  0.075974845  0.09130912    1
17. tBodyAccJerk-mean()-Y       -1 -0.01855500  0.010752703  0.03353829    1
18. tBodyAccJerk-mean()-Z       -1 -0.03155237 -0.001159299  0.02457797    1
19. tBodyAccJerk-std()-X        -1 -0.99127192 -0.951302850 -0.29120268    1
20. tBodyAccJerk-std()-Y        -1 -0.98500688 -0.925044040 -0.22177298    1
21. tBodyAccJerk-std()-Z        -1 -0.98919567 -0.954278610 -0.54848816    1
22. tBodyGyro-mean()-X          -1 -0.04578711 -0.027762646 -0.01057650    1
23. tBodyGyro-mean()-Y          -1 -0.10399034 -0.074767602 -0.05109640    1
24. tBodyGyro-mean()-Z          -1  0.06484607  0.086261317  0.11043857    1
25. tBodyGyro-std()-X           -1 -0.98719066 -0.901593560 -0.48222822    1
26. tBodyGyro-std()-Y           -1 -0.98189823 -0.910564400 -0.44608838    1
27. tBodyGyro-std()-Z           -1 -0.98500822 -0.881920590 -0.33789777    1
28. tBodyGyroJerk-mean()-X      -1 -0.11723261 -0.098243380 -0.07930400    1
29. tBodyGyroJerk-mean()-Y      -1 -0.05868148 -0.040556805 -0.02521094    1
30. tBodyGyroJerk-mean()-Z      -1 -0.07935805 -0.054554317 -0.03168264    1
31. tBodyGyroJerk-std()-X       -1 -0.99072564 -0.934808640 -0.48653805    1
32. tBodyGyroJerk-std()-Y       -1 -0.99223414 -0.954788510 -0.62679006    1
33. tBodyGyroJerk-std()-Z       -1 -0.99256745 -0.950314220 -0.50971305    1
34. tBodyAccMag-mean()          -1 -0.98191531 -0.874634910 -0.12014189    1
35. tBodyAccMag-std()           -1 -0.98218158 -0.843707960 -0.24232329    1
36. tGravityAccMag-mean()       -1 -0.98191531 -0.874634910 -0.12014189    1
37. tGravityAccMag-std()        -1 -0.98218158 -0.843707960 -0.24232329    1
38. tBodyAccJerkMag-mean()      -1 -0.98955992 -0.948094840 -0.29558424    1
39. tBodyAccJerkMag-std()       -1 -0.99068748 -0.928839470 -0.27332015    1
40. tBodyGyroMag-mean()         -1 -0.97813575 -0.822286820 -0.24535442    1
41. tBodyGyroMag-std()          -1 -0.97749150 -0.825883310 -0.39404253    1
42. tBodyGyroJerkMag-mean()     -1 -0.99232565 -0.955936850 -0.54985006    1
43. tBodyGyroJerkMag-std()      -1 -0.99219099 -0.940302310 -0.60933846    1
44. fBodyAcc-mean()-X           -1 -0.99125595 -0.945579180 -0.26455476    1
45. fBodyAcc-mean()-Y           -1 -0.97921838 -0.864344940 -0.10322840    1
46. fBodyAcc-mean()-Z           -1 -0.98322684 -0.895353610 -0.36624006    1
47. fBodyAcc-std()-X            -1 -0.99291664 -0.941575270 -0.24934469    1
48. fBodyAcc-std()-Y            -1 -0.97688738 -0.832612870 -0.09215631    1
49. fBodyAcc-std()-Z            -1 -0.97797651 -0.839787210 -0.30225207    1
50. fBodyAccJerk-mean()-X       -1 -0.99124468 -0.951595280 -0.32698327    1
51. fBodyAccJerk-mean()-Y       -1 -0.98477616 -0.925702130 -0.26384688    1
52. fBodyAccJerk-mean()-Z       -1 -0.98728199 -0.947533360 -0.51332898    1
53. fBodyAccJerk-std()-X        -1 -0.99202975 -0.956240970 -0.32030207    1
54. fBodyAccJerk-std()-Y        -1 -0.98646733 -0.928034440 -0.23609695    1
55. fBodyAccJerk-std()-Z        -1 -0.98953209 -0.958984300 -0.59028609    1
56. fBodyGyro-mean()-X          -1 -0.98531089 -0.891687310 -0.38367297    1
57. fBodyGyro-mean()-Y          -1 -0.98472398 -0.919693170 -0.47348225    1
58. fBodyGyro-mean()-Z          -1 -0.98513328 -0.887712590 -0.32245718    1
59. fBodyGyro-std()-X           -1 -0.98809624 -0.905326340 -0.52245449    1
60. fBodyGyro-std()-Y           -1 -0.98084305 -0.906101200 -0.43850274    1
61. fBodyGyro-std()-Z           -1 -0.98617650 -0.891505790 -0.41676661    1
62. fBodyAccMag-mean()          -1 -0.98473743 -0.875502800 -0.21731156    1
63. fBodyAccMag-std()           -1 -0.98288442 -0.854727980 -0.38232853    1
64. fBodyBodyAccJerkMag-mean()  -1 -0.98978358 -0.928986990 -0.25997022    1
65. fBodyBodyAccJerkMag-std()   -1 -0.99066431 -0.925531510 -0.30815237    1
66. fBodyBodyGyroMag-mean()     -1 -0.98250154 -0.875620040 -0.45139980    1
67. fBodyBodyGyroMag-std()      -1 -0.97815001 -0.827489750 -0.47126672    1
68. fBodyBodyGyroJerkMag-mean() -1 -0.99210840 -0.945344360 -0.61224246    1
69. fBodyBodyGyroJerkMag-std()  -1 -0.99257489 -0.938212430 -0.64373796    1
