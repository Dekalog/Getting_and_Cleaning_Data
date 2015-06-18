# TASK INSTRUCTIONS
#
# You should create one R script called run_analysis.R that does the following. 
# 
# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names. 
# 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Load the required package dplyr
library( dplyr )

# load all the different required .txt files from the R working directory
subject_train <- read.table( "subject_train.txt" )       # identifier of the individual subjects, a number from 1 to 30
X_train <- read.table( "X_train.txt" )                   # raw training data ( a df 7352 by 561 )
y_train <- read.table( "y_train.txt" )                   # training label, 1 to 6, indentified from activity_labels.txt file
subject_test <- read.table( "subject_test.txt" )         # identifier of the individual subjects, a number from 1 to 30
X_test <- read.table( "X_test.txt" )                     # raw test data ( a df 2947 by 561 )
y_test <- read.table( "y_test.txt" )                     # training label, 1 to 6, indentified from activity_labels.txt file
features <- read.table( "features.txt" )                 # the features labels e.g. -> tBodyAcc-mean()-X, tBodyAcc-mean()-Y etc.

# put all the "relevant columns" from the X_train and X_test dfs above into one big df, called "raw_data"
# The "relevant columns" are indicated by the "cols_to_keep" value. See the CodeBook.md file for details of "cols_to_keep"
cols_to_keep <- c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543)
raw_data <- rbind( X_train[ , cols_to_keep ] , X_test[ , cols_to_keep ] )

# add the subjects and activities to the beginning of the raw_data df, as two separate columns
raw_data <- cbind( rbind( subject_train , subject_test ) , rbind( y_train , y_test ) , raw_data )

# make column labels for this raw_data df from features
labels_for_columns <- make.names( features[ cols_to_keep , 2 ] , unique = TRUE )

# However, we need to rename some of these column label names, namely
# fBodyBodyAccJerkMag.mean()
# fBodyBodyAccJerkMag.std()
# fBodyBodyGyroMag.mean()
# fBodyBodyGyroMag.std()
# fBodyBodyGyroJerkMag.mean()
# fBodyBodyGyroJerkMag.std()
# because the double "BodyBody" part is a mistake
labels_for_columns[61] <- "fBodyAccJerkMag.mean()"
labels_for_columns[62] <- "fBodyAccJerkMag.std()"
labels_for_columns[63] <- "fBodyGyroMag.mean()"
labels_for_columns[64] <- "fBodyGyroMag.std()"
labels_for_columns[65] <- "fBodyGyroJerkMag.mean()"
labels_for_columns[66] <- "fBodyGyroJerkMag.std()"

# add column names for "subject" and "activity" columns
labels_for_columns <- c( "subject" , "activity" , labels_for_columns )

# and now add these labels_for_columns to the raw_data df
names( raw_data ) <- labels_for_columns

# now tidy up the raw_data using the dplyr package
tidy_raw_data <- arrange( raw_data , subject , activity )

# calculate the means of all the columnwise variables, grouping the means by subject and activity
means <- aggregate( tidy_raw_data , list( tidy_raw_data$activity , tidy_raw_data$subject ) , FUN = mean )

# replace the numbers, 1 to 6, in the means$activity column of means df with meaningful names from activity_labels.txt
means$activity[ means$activity == 1 ] <- "walking"
means$activity[ means$activity == 2 ] <- "walkingupstairs"
means$activity[ means$activity == 3 ] <- "walkingdownstairs"
means$activity[ means$activity == 4 ] <- "sitting"
means$activity[ means$activity == 5 ] <- "standing"
means$activity[ means$activity == 6 ] <- "laying"

# drop the Group.1 and Group.2 columns that were added by the call to aggregate
means <- select( means , -Group.1 , -Group.2 )

# and finally write to text file, as per task instructions
write.table( means , file = "all_means.txt" , row.names = FALSE )