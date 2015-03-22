##This script taking a raw data from Samsung devices, manipulate with data and select special colums of subjects, avtivity and mean&std variables

train_x <- read.table("train/X_train.txt") ##reading X_train variables

test_x <- read.table("test/X_test.txt") ##reading X_test variables

train_y <- read.table("train/Y_train.txt") ##reading Y_train variables

test_y <- read.table("test/y_test.txt") ##reading Y_test variables

train_subject <- read.table("train/subject_train.txt") ##reading subject_train variables

test_subject <- read.table("test/subject_test.txt") ##reading subject_test variables

activity_labels <- read.table("activity_labels.txt") ##reading activity_labels

features <- read.table("features.txt") ##reading features for column names

names(train_subject) <- c("Subject") ##define column name to train subject

names(test_subject) <- c("Subject") ##define column name to test subject

names(train_y) <- c("activity_id") ##define column name to train_y

names(test_y) <- c("activity_id") ##define column name to test y

names(activity_labels) <- c("activity_id","activity_name") ##define column names to activity labels

activity_train_y = merge(train_y, activity_labels, by.x="activity_id", by.y="activity_id") ##merging activity name to train_y by activity_id

activity_test_y = merge(test_y, activity_labels, by.x="activity_id", by.y="activity_id") ##merging activity name to test_y by activity_id

names(train_x) <- c(as.character(t(features[,2]))) ##adding column names to train_x by transposing vector from features.txt

names(test_x) <- c(as.character(t(features[,2]))) ##adding column names to test_x by transposing vector from features.txt

train <- cbind(train_subject, activity_train_y, train_x) ##combine by columns train_subject, activity_train and train x for making train data

test <- cbind(test_subject, activity_test_y, test_x) ##combine by columns text_subject, activity_test and test x for making test data

train_test <- rbind(train, test) ##combine by rows train and test data

library("dplyr") ##loading dplyr package for data manipulation

data <- tbl_df(train_test) ##define data

valid_column_names <- make.names(names=names(data), unique=TRUE, allow_ = TRUE) ## making a valid column names, because there are duplicates in values

names(data) <- valid_column_names #define appropriate column names to data

tidy_data <- select(data, matches("(Subject)+|(activity_name)+|(mean)+|(std)+", ignore.case = FALSE)) ##selecting special columns with mean, std, Subject and activity_name

average_values <- group_by(tidy_data, Subject, activity_name) ##Group by subject and activity to calculate average values

average_values_data <- summarize(average_values, mean(average_values[,3:88])) ## summarizing mean data of variables

write.table(tidy_data, file='tidy_data.txt', col.names=TRUE, row.names=FALSE) ##writing tidy data to txt file to working directory