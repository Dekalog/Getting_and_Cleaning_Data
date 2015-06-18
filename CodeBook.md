## CodeBook
This CodeBook describes

a) the raw data

b) the choices made in processing the raw data

c) the data contained in the tidy data set file named "all_means.txt" 

### a) Collection of the raw data
The raw data ( UCI HAR Dataset ) was downloaded from the following link

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and unzipped. From the unzipped folders named "test" and "train" the following text files were copied to the R working directory where the "run_analysis.R" processing script file is kept.

subject_train.txt

X_train.txt

y_train.txt

subject_test.txt

X_test.txt

y_test.txt

features.txt

activity_labels.txt

## b) data pre-processing
According to assignment instruction no.2 the script should

"Extract(s) only the measurements on the mean and standard deviation for each measurement."

It is assumed that this means that only those varibles that are explicitly calculated with either a mean() or std() should be included. Visual inspection of the above "features.txt" results in only the following columns of the raw data being kept:-

1 tBodyAcc-mean()-X

2 tBodyAcc-mean()-Y

3 tBodyAcc-mean()-Z

4 tBodyAcc-std()-X

5 tBodyAcc-std()-Y

6 tBodyAcc-std()-Z

41 tGravityAcc-mean()-X

42 tGravityAcc-mean()-Y

43 tGravityAcc-mean()-Z

44 tGravityAcc-std()-X

45 tGravityAcc-std()-Y

46 tGravityAcc-std()-Z

81 tBodyAccJerk-mean()-X

82 tBodyAccJerk-mean()-Y

83 tBodyAccJerk-mean()-Z

84 tBodyAccJerk-std()-X

85 tBodyAccJerk-std()-Y

86 tBodyAccJerk-std()-Z

121 tBodyGyro-mean()-X

122 tBodyGyro-mean()-Y

123 tBodyGyro-mean()-Z

124 tBodyGyro-std()-X

125 tBodyGyro-std()-Y

126 tBodyGyro-std()-Z

161 tBodyGyroJerk-mean()-X

162 tBodyGyroJerk-mean()-Y

163 tBodyGyroJerk-mean()-Z

164 tBodyGyroJerk-std()-X

165 tBodyGyroJerk-std()-Y

166 tBodyGyroJerk-std()-Z

201 tBodyAccMag-mean()

202 tBodyAccMag-std()

214 tGravityAccMag-mean()

215 tGravityAccMag-std()

227 tBodyAccJerkMag-mean()

228 tBodyAccJerkMag-std()

240 tBodyGyroMag-mean()

241 tBodyGyroMag-std()

253 tBodyGyroJerkMag-mean()

254 tBodyGyroJerkMag-std()

266 fBodyAcc-mean()-X

267 fBodyAcc-mean()-Y

268 fBodyAcc-mean()-Z

269 fBodyAcc-std()-X

270 fBodyAcc-std()-Y

271 fBodyAcc-std()-Z

345 fBodyAccJerk-mean()-X

346 fBodyAccJerk-mean()-Y

347 fBodyAccJerk-mean()-Z

348 fBodyAccJerk-std()-X

349 fBodyAccJerk-std()-Y

350 fBodyAccJerk-std()-Z

424 fBodyGyro-mean()-X

425 fBodyGyro-mean()-Y

426 fBodyGyro-mean()-Z

427 fBodyGyro-std()-X

428 fBodyGyro-std()-Y

429 fBodyGyro-std()-Z

503 fBodyAccMag-mean()

504 fBodyAccMag-std()

516 fBodyBodyAccJerkMag-mean()

517 fBodyBodyAccJerkMag-std()

529 fBodyBodyGyroMag-mean()

530 fBodyBodyGyroMag-std()

542 fBodyBodyGyroJerkMag-mean()

543 fBodyBodyGyroJerkMag-std()
 
due to either -mean() or -std() indicating that a mean or standard deviation is used, and where the leftmost number is the absolute numeric index value in "features.txt" that references the column position in both "X_train.txt" and "X_test.txt" for the respectively named feature variable. These numbers are hard coded into the "run_analysis.R" script variable named "cols_to_keep" which is used to extract the required columns from loaded R data frames. Note that the last six values have a syntax mistake in the variable name, where "Body" is repeated as "BodyBody." The R script corrects this error when applying these names as column labels.
 
## Creating the tidy datafile
Ensure that all data files are unpacked to the current working R directory, as described in a) above, and source the "run_analysis.R" script in an R session
 
## Description of the variables in the all_means.txt file
 - The text file has data for an R data frame of size 181 rows and 68 columns, with row no.1 being a header row with names for the 68 columns and the remaining 180 rows containing the data. There are no row names.

 - the numeric data ( columns 3 to 68 inclusive ) are grouped mean values of the raw data from both "X_train.txt" and "X_test.txt," grouped by subject in "subject_train.txt" and "subject_test.txt" and activity in "activity_labels.txt"
 
 - the variable/column names are ( from calling names() in R ) :-
[1] "subject"                 "activity"                "tBodyAcc.mean...X"       "tBodyAcc.mean...Y"       "tBodyAcc.mean...Z"      
[6] "tBodyAcc.std...X"        "tBodyAcc.std...Y"        "tBodyAcc.std...Z"        "tGravityAcc.mean...X"    "tGravityAcc.mean...Y"   
[11] "tGravityAcc.mean...Z"    "tGravityAcc.std...X"     "tGravityAcc.std...Y"     "tGravityAcc.std...Z"     "tBodyAccJerk.mean...X"  
[16] "tBodyAccJerk.mean...Y"   "tBodyAccJerk.mean...Z"   "tBodyAccJerk.std...X"    "tBodyAccJerk.std...Y"    "tBodyAccJerk.std...Z"   
[21] "tBodyGyro.mean...X"      "tBodyGyro.mean...Y"      "tBodyGyro.mean...Z"      "tBodyGyro.std...X"       "tBodyGyro.std...Y"      
[26] "tBodyGyro.std...Z"       "tBodyGyroJerk.mean...X"  "tBodyGyroJerk.mean...Y"  "tBodyGyroJerk.mean...Z"  "tBodyGyroJerk.std...X"  
[31] "tBodyGyroJerk.std...Y"   "tBodyGyroJerk.std...Z"   "tBodyAccMag.mean.."      "tBodyAccMag.std.."       "tGravityAccMag.mean.."  
[36] "tGravityAccMag.std.."    "tBodyAccJerkMag.mean.."  "tBodyAccJerkMag.std.."   "tBodyGyroMag.mean.."     "tBodyGyroMag.std.."     
[41] "tBodyGyroJerkMag.mean.." "tBodyGyroJerkMag.std.."  "fBodyAcc.mean...X"       "fBodyAcc.mean...Y"       "fBodyAcc.mean...Z"      
[46] "fBodyAcc.std...X"        "fBodyAcc.std...Y"        "fBodyAcc.std...Z"        "fBodyAccJerk.mean...X"   "fBodyAccJerk.mean...Y"  
[51] "fBodyAccJerk.mean...Z"   "fBodyAccJerk.std...X"    "fBodyAccJerk.std...Y"    "fBodyAccJerk.std...Z"    "fBodyGyro.mean...X"     
[56] "fBodyGyro.mean...Y"      "fBodyGyro.mean...Z"      "fBodyGyro.std...X"       "fBodyGyro.std...Y"       "fBodyGyro.std...Z"      
[61] "fBodyAccMag.mean.."      "fBodyAccMag.std.."       "fBodyAccJerkMag.mean.."  "fBodyAccJerkMag.std.."   "fBodyGyroMag.mean.."    
[66] "fBodyGyroMag.std.."      "fBodyGyroJerkMag.mean.." "fBodyGyroJerkMag.std.."

which are decribed in the next section.
 
### Variable descriptions of data in "all_means.txt"
In the variable descriptions of the data that follow, taking for example "3 tBodyAcc.mean().X -> ...... "

the integer 3 is the absolute column index value, i.e. the third column
 
the character string "tBodyAcc.mean().X" is the description of the raw data value measurement and also the column label of the data. This description is parsed as follows:-

 - prefix 't' denotes time domain signals captured at a constant rate of 50 Hz, filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise

 - prefix 'f' denotes frequency domain signals captured by a Fast Fourier Transform (FFT) of the time domain signal

 - Body denotes body signals derived and separated out from time domain signals

 - Gravity denotes gravity signals derived and separated out from time domain signals

 - Acc denotes acceleration signals derived from time domain signals

 - Gyro denotes gyroscopic signals derived from time domain signals

 - Jerk denotes Jerk signals derived from linear acceleration and angular velocity of time domain signals

 - Mag denotes the three-dimensional Euclidean norm magnitude of signals

 - X Y and Z denote the separate directions of the 3-axial raw signals

 - mean() denotes that a mean was used in the signal calculation

 - std() denotes that a standard deviation was used in the signal calculation

so taking the "3 tBodyAcc.mean().X -> ...... " example, this is read as

"the third column contains a time domain signal of the body accelaration in the X direction, and the underlying raw data was calculated using a mean() value"

the description that follows the "->" is a description of the class and value contained in the respective columns
 
IMPORTANT NOTE!
The variable descriptions/column labels are kept the same as in the raw data text files for the sake of consistency, and to identify which raw data measurement is being averaged for this assignment. However, the actual numeric values in columns 3 to 68 inclusive are NOT these raw values but the grouped means of these values as returned by the "aggregate" function in R. 
Again taking the "3 tBodyAcc.mean().X -> ...... " example, if we take row 10 of the data frame it can be seen that the subject on row 10 in column 1 is the subect identified as "2" and the activity in column 2 is "SITTING," thus the value in row 10 column 3 is the mean of all the raw values in files "X_train.txt" and "X_test.txt" for subject 2 and activity == sitting
for the measurement of the "time domain signal of the body accelaration in the X direction, calculated with a mean."

1 subject -> an integer value from 1 to 30 to indicate individual subjects in the data

2 activity -> a factor value with six levels, Levels: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS to indicate which activity the subsequent grouped means columns ( columns 3 to 68 inclusive ) are aggregate means of, per subject in column no.1 above 

3 tBodyAcc.mean().X -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

4 tBodyAcc.mean().Y -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

5 tBodyAcc.mean().Z -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

6 tBodyAcc.std().X -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

7 tBodyAcc.std().Y -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

8 tBodyAcc.std().Z -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

9 tGravityAcc.mean().X -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

10 tGravityAcc.mean().Y -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

11 tGravityAcc.mean().Z -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

12 tGravityAcc.std().X -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

13 tGravityAcc.std().Y -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

14 tGravityAcc.std().Z -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

15 tBodyAccJerk.mean().X -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

16 tBodyAccJerk.mean().Y -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

17 tBodyAccJerk.mean().Z -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

18 tBodyAccJerk.std().X -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

19 tBodyAccJerk.std().Y -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

20 tBodyAccJerk.std().Z -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

21 tBodyGyro.mean().X -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

22 tBodyGyro.mean().Y -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

23 tBodyGyro.mean().Z -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

24 tBodyGyro.std().X -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

25 tBodyGyro.std().Y -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

26 tBodyGyro.std().Z -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

27 tBodyGyroJerk.mean().X -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

28 tBodyGyroJerk.mean().Y -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

29 tBodyGyroJerk.mean().Z -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

30 tBodyGyroJerk.std().X -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

31 tBodyGyroJerk.std().Y -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

32 tBodyGyroJerk.std().Z -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

33 tBodyAccMag.mean() -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

34 tBodyAccMag.std() -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

35 tGravityAccMag.mean() -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

36 tGravityAccMag.std() -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

37 tBodyAccJerkMag.mean() -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

38 tBodyAccJerkMag.std() -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

39 tBodyGyroMag.mean() -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

40 tBodyGyroMag.std() -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

41 tBodyGyroJerkMag.mean() -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

42 tBodyGyroJerkMag.std() -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

43 fBodyAcc.mean().X -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

44 fBodyAcc.mean().Y -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

45 fBodyAcc.mean().Z -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

46 fBodyAcc.std().X -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

47 fBodyAcc.std().Y -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

48 fBodyAcc.std().Z -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

49 fBodyAccJerk.mean().X -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

50 fBodyAccJerk.mean().Y -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

51 fBodyAccJerk.mean().Z -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

52 fBodyAccJerk.std().X -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

53 fBodyAccJerk.std().Y -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

54 fBodyAccJerk.std().Z -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

55 fBodyGyro.mean().X -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

56 fBodyGyro.mean().Y -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

57 fBodyGyro.mean().Z -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

58 fBodyGyro.std().X -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

59 fBodyGyro.std().Y -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

60 fBodyGyro.std().Z -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

61 fBodyAccMag.mean() -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

62 fBodyAccMag.std() -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

63 fBodyAccJerkMag.mean() -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

64 fBodyAccJerkMag.std() -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

65 fBodyGyroMag.mean() -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

66 fBodyGyroMag.std() -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

67 fBodyGyroJerkMag.mean() -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2

68 fBodyGyroJerkMag.std() -> a numeric value of grouped means for this column variable grouped by subject and activity from columns 1 and 2
