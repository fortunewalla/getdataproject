---
title: Codebook
author: fwala
date: Saturday, February 21, 2015
output: html_document
---


##Codebook.md

**CodeBook is done for final reduced tidy data set.** 

* CodeBook based on interpretation from UCI project files.

* Codebook was used to rename & label variables with a descriptive scheme for easy interpretation.

* Variable Range: Normalized, -1 to 1 (Unless mentioned.)

**`T_` indicates signals were derived in time domain.:**
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

**`F_` indicates signals are in the frequency domain.:**
i.e. the Fast Fourier Transform (FFT) was applied to these signals.

**`BODY` indicates acceleration signal generated due to the body.:**
The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

**`GRAVITY` indicates acceleration signal generated due to gravity.:**
The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

**`ACC` indicates signal due to linear accelaration.:**

**`GYRO` indicates signal due to angular velocity.:**

**`JERK` indicates the jerk signals.:**
The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).

**`MAG` indicates the magnitude of the signal.:**
The magnitude of these three-dimensional signals were calculated using the Euclidean norm.

**`MEAN` indicates the arithmetic mean of the signal measured.:**

**`STD` indicates the standard deviation of the signal measured.:**

**`MEANFREQ` indicates the mean frequency of the signal components.:**
Mean frequency is the weighted average of the frequency components


###Using the R command `names(cstidy)` we get the column names:

```
 [1] SUBJECT_ID  ACTIVITY_LABEL 
 [3] ACTIVITY_ID T_BODY_ACC_MEAN_X  
 [5] T_BODY_ACC_MEAN_Y T_BODY_ACC_MEAN_Z  
 [7] T_BODY_ACC_STD_X  T_BODY_ACC_STD_Y 
 [9] T_BODY_ACC_STD_Z  T_GRAVITY_ACC_MEAN_X 
[11] T_GRAVITY_ACC_MEAN_Y  T_GRAVITY_ACC_MEAN_Z 
[13] T_GRAVITY_ACC_STD_X T_GRAVITY_ACC_STD_Y  
[15] T_GRAVITY_ACC_STD_Z T_BODY_ACCJERK_MEAN_X  
[17] T_BODY_ACCJERK_MEAN_Y T_BODY_ACCJERK_MEAN_Z  
[19] T_BODY_ACCJERK_STD_X  T_BODY_ACCJERK_STD_Y 
[21] T_BODY_ACCJERK_STD_Z  T_BODY_GYRO_MEAN_X 
[23] T_BODY_GYRO_MEAN_Y  T_BODY_GYRO_MEAN_Z 
[25] T_BODY_GYRO_STD_X T_BODY_GYRO_STD_Y  
[27] T_BODY_GYRO_STD_Z T_BODY_GYROJERK_MEAN_X 
[29] T_BODY_GYROJERK_MEAN_Y  T_BODY_GYROJERK_MEAN_Z 
[31] T_BODY_GYROJERK_STD_X T_BODY_GYROJERK_STD_Y  
[33] T_BODY_GYROJERK_STD_Z T_BODY_ACCMAG_MEAN 
[35] T_BODY_ACCMAG_STD T_GRAVITY_ACCMAG_MEAN  
[37] T_GRAVITY_ACCMAG_STD  T_BODY_ACCJERKMAG_MEAN 
[39] T_BODY_ACCJERKMAG_STD T_BODY_GYROMAG_MEAN  
[41] T_BODY_GYROMAG_STD  T_BODY_GYROJERKMAG_MEAN  
[43] T_BODY_GYROJERKMAG_STD  F_BODY_ACC_MEAN_X  
[45] F_BODY_ACC_MEAN_Y F_BODY_ACC_MEAN_Z  
[47] F_BODY_ACC_STD_X  F_BODY_ACC_STD_Y 
[49] F_BODY_ACC_STD_Z  F_BODY_ACC_MEANFREQ_X  
[51] F_BODY_ACC_MEANFREQ_Y F_BODY_ACC_MEANFREQ_Z  
[53] F_BODY_ACCJERK_MEAN_X F_BODY_ACCJERK_MEAN_Y  
[55] F_BODY_ACCJERK_MEAN_Z F_BODY_ACCJERK_STD_X 
[57] F_BODY_ACCJERK_STD_Y  F_BODY_ACCJERK_STD_Z 
[59] F_BODY_ACCJERK_MEANFREQ_X F_BODY_ACCJERK_MEANFREQ_Y  
[61] F_BODY_ACCJERK_MEANFREQ_Z F_BODY_GYRO_MEAN_X 
[63] F_BODY_GYRO_MEAN_Y  F_BODY_GYRO_MEAN_Z 
[65] F_BODY_GYRO_STD_X F_BODY_GYRO_STD_Y  
[67] F_BODY_GYRO_STD_Z F_BODY_GYRO_MEANFREQ_X 
[69] F_BODY_GYRO_MEANFREQ_Y  F_BODY_GYRO_MEANFREQ_Z 
[71] F_BODY_ACCMAG_MEAN  F_BODY_ACCMAG_STD  
[73] F_BODY_ACCMAG_MEANFREQ  F_BODY_BODY_ACCJERKMAG_MEAN  
[75] F_BODY_BODY_ACCJERKMAG_STD  F_BODY_BODY_ACCJERKMAG_MEANFREQ
[77] F_BODY_BODYGYROMAG_MEAN F_BODY_BODYGYROMAG_STD 
[79] F_BODY_BODYGYROMAG_MEANFREQ F_BODY_BODYGYROJERKMAG_MEAN  
[81] F_BODY_BODYGYROJERKMAG_STD  F_BODY_BODYGYROJERKMAG_MEANFREQ
```


* Variable Name: `SUBJECT_ID`

Range: 1 to 30

Short Description: Identification number of the subject

Long Description:A group of 30 volunteers within an age bracket of 19-48 years.


* Variable Name: `ACTIVITY_LABEL`

Range: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Short Description: Type of activity performed by each subject.

Long Description: while wearing a smartphone (Samsung Galaxy S II) on the waist.

* Variable Name: `ACTIVITY_ID`

Range: 1 to 6

Short Description: ID number of activity performed by each subject.

Long Description: while wearing a smartphone (Samsung Galaxy S II) on the waist.

**Sensor variables used & grouped according to common readings.**

* Variable Name: `T_BODY_ACC_MEAN_X` `T_BODY_ACC_MEAN_Y` `T_BODY_ACC_MEAN_Z` 

* Variable Name: `T_BODY_ACC_STD_X`  `T_BODY_ACC_STD_Y` `T_BODY_ACC_STD_Z`  

* Variable Name: `T_GRAVITY_ACC_MEAN_X` `T_GRAVITY_ACC_MEAN_Y`  `T_GRAVITY_ACC_MEAN_Z` 

* Variable Name: `T_GRAVITY_ACC_STD_X` `T_GRAVITY_ACC_STD_Y`  `T_GRAVITY_ACC_STD_Z` 

* Variable Name: `T_BODY_ACCJERK_MEAN_X`  `T_BODY_ACCJERK_MEAN_Y` `T_BODY_ACCJERK_MEAN_Z` 

* Variable Name: `T_BODY_ACCJERK_STD_X`  `T_BODY_ACCJERK_STD_Y` `T_BODY_ACCJERK_STD_Z` 

* Variable Name: `T_BODY_GYRO_MEAN_X` `T_BODY_GYRO_MEAN_Y`  `T_BODY_GYRO_MEAN_Z` 

* Variable Name: `T_BODY_GYRO_STD_X` `T_BODY_GYRO_STD_Y`  `T_BODY_GYRO_STD_Z`  

* Variable Name: `T_BODY_GYROJERK_MEAN_X` `T_BODY_GYROJERK_MEAN_Y`  `T_BODY_GYROJERK_MEAN_Z` 

* Variable Name: `T_BODY_GYROJERK_STD_X` `T_BODY_GYROJERK_STD_Y` `T_BODY_GYROJERK_STD_Z`  

* Variable Name: `T_BODY_ACCMAG_MEAN` `T_BODY_ACCMAG_STD`  

* Variable Name: `T_GRAVITY_ACCMAG_MEAN`  `T_GRAVITY_ACCMAG_STD` 

* Variable Name: `T_BODY_ACCJERKMAG_MEAN` `T_BODY_ACCJERKMAG_STD`  

* Variable Name: `T_BODY_GYROMAG_MEAN`  `T_BODY_GYROMAG_STD` 

* Variable Name: `T_BODY_GYROJERKMAG_MEAN`  `T_BODY_GYROJERKMAG_STD` 

* Variable Name: `F_BODY_ACC_MEAN_X`  `F_BODY_ACC_MEAN_Y` `F_BODY_ACC_MEAN_Z`  

* Variable Name: `F_BODY_ACC_STD_X`  `F_BODY_ACC_STD_Y` `F_BODY_ACC_STD_Z`  

* Variable Name: `F_BODY_ACC_MEANFREQ_X`  `F_BODY_ACC_MEANFREQ_Y` `F_BODY_ACC_MEANFREQ_Z` 

* Variable Name: `F_BODY_ACCJERK_MEAN_X` `F_BODY_ACCJERK_MEAN_Y`  `F_BODY_ACCJERK_MEAN_Z`  

* Variable Name: `F_BODY_ACCJERK_STD_X` `F_BODY_ACCJERK_STD_Y`  `F_BODY_ACCJERK_STD_Z` 

* Variable Name: `F_BODY_ACCJERK_MEANFREQ_X` `F_BODY_ACCJERK_MEANFREQ_Y`  `F_BODY_ACCJERK_MEANFREQ_Z` 

* Variable Name: `F_BODY_GYRO_MEAN_X`  `F_BODY_GYRO_MEAN_Y`  `F_BODY_GYRO_MEAN_Z` 

* Variable Name: `F_BODY_GYRO_STD_X` `F_BODY_GYRO_STD_Y`  `F_BODY_GYRO_STD_Z`  

* Variable Name: `F_BODY_GYRO_MEANFREQ_X` `F_BODY_GYRO_MEANFREQ_Y`  `F_BODY_GYRO_MEANFREQ_Z`

* Variable Name: `F_BODY_ACCMAG_MEAN`  `F_BODY_ACCMAG_STD` `F_BODY_ACCMAG_MEANFREQ`  

* Variable Name: `F_BODY_BODY_ACCJERKMAG_MEAN`  `F_BODY_BODY_ACCJERKMAG_STD`  `F_BODY_BODY_ACCJERKMAG_MEANFREQ`

* Variable Name: `F_BODY_BODYGYROMAG_MEAN` `F_BODY_BODYGYROMAG_STD` `F_BODY_BODYGYROMAG_MEANFREQ` 

* Variable Name: `F_BODY_BODYGYROJERKMAG_MEAN`  `F_BODY_BODYGYROJERKMAG_STD`  `F_BODY_BODYGYROJERKMAG_MEANFREQ`
