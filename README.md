# Getting_and_Cleaning_Data
Repo created for the Coursera course Getting and Cleaning Data Project

NOTE!
The run_analysis.R script requires the use of the dplyr package, so this package must be installed before the
run_analysis.R script is called. Also, before the script is called the raw data must be downloaded from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

and the zip file unzipped and the following files need to be copied to the R working directory where the run_analysis.R script resides.

subject_train.txt

X_train.txt

y_train.txt

subject_test.txt

X_test.txt

y_test.txt

features.txt

In this order the "run_analysis.R" script:-

1) loads the dplyr package

2) loads the above text files into R data frames

3) creates an index into these R data frames, called "cols_to_keep," which is used to extract only those columns of interest from the data frames loaded from the raw data .txt files loaded in step 2 above. For a description of which columns are kept, and why, refer to the "CodeBook.md" file. 

4) the separate R data frames are combined into one big data frame, called "raw_data," using the above "cols_to_keep" subsetting variable and a combination of the standard R functions rbind() and cbind().

5) labels are created for the naming of the columns of this big data frame. During this stage some syntax errors contained in the "features.txt" file from which the labels are taken are corrected. More details of these errors and their corrections are provided in both the comments contained in the "run_analysis.R" script itself and the "CodeBook.md" file.

6) these column labels are added to the "raw_data" data frame.

7) this "raw_data" data frame is then tidied up using the dplyr "arrange" function so that all the measurements for each individual subject are contiguous in the data frame, ordered by activity, and in the same order for each subject. The subjects are ordered in ascending order, 1 to 30.

8) the means of these ordered groups are then calculated, via the "aggregate" function, as per the task instruction no.5, and assigned to a data frame called "means."

9) the activity labels in the "means" data frame, which at the momemt are 1 to 6 as described in the "activity_labels.txt" file, are then replaced with more meaningful labels such as walking, sitting etc. and two unecessary columns added by the "aggregate" function are dropped.

10) the final result, the "means" data frame, is then printed to a file named "all_means.txt" via the "write.table" function as per the task instructions.

This final "all_means.txt" result is tidy data according to the principles of tidy data because:-

a) each variable is in its own column, i.e. the subjects are in the first coulmn, the activity in the second column, the first set of grouped means for the first variable in the raw data is in the third column etc. 

b) each different grouped mean observation is in a different row, i.e. observations for subject no.1 and activity == walking are in the first row, subject no.1 and activity == walkingupstairs are in the second row etc.

c) the entire tidy data set is of one type of measurement - grouped means of the raw data - grouped by subject, activity and variable as described in a) and b) above. 