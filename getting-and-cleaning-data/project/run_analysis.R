#Merges the training and the test sets to create one data set.

# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 

#Merge Subject
subject_test = read.table("./dataset/test/subject_test.txt")
subject_train = read.table("./dataset/train/subject_train.txt")
subject <- rbind(subject_test, subject_train)

#Give the name to the subject
names(subject) <- "subjectId"
# > head(subject)
# subjectId
# 1         2
# 2         2
# 3         2

#Read features and activities
features <- read.table("./dataset/features.txt", col.names=c("feature_id", "feature_label"))
# feature_id     feature_label
# 1          1 tBodyAcc-mean()-X
# 2          2 tBodyAcc-mean()-Y
# 3          3 tBodyAcc-mean()-Z
# 4          4  tBodyAcc-std()-X
# 5          5  tBodyAcc-std()-Y
# 6          6  tBodyAcc-std()-Z


# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Take index that has mean and std value from the features
index_mean_std <- grep("-mean\\(\\)|-std\\(\\)", features$feature_label)

activities <- read.table("./dataset/activity_labels.txt", col.names=c("activity_id", "activity_label"))
# > head(activities)
# activity_id     activity_label
# 1           1            WALKING
# 2           2   WALKING_UPSTAIRS
# 3           3 WALKING_DOWNSTAIRS
# 4           4            SITTING
# 5           5           STANDING
# 6           6             LAYING

#Read data on X value and merge
X_test = read.table("./dataset/test/X_test.txt")
X_train = read.table("./dataset/train/X_train.txt")
X_combine <- rbind(X_test, X_train)
#Take the value only on column mean and std
filtered_X_combine <- X_combine[, index_mean_std]
#Rename the filtered X combine file with the feature label
names(filtered_X_combine) <- features$feature_label[index_mean_std]

#Read data on Y value and merge
Y_test = read.table("./dataset/test/Y_test.txt")
Y_train = read.table("./dataset/train/Y_train.txt")
Y_combine <- rbind(Y_test, Y_train)
#Add label name for Y_combine for referencing to the activity
names(Y_combine) = "activity_id"

#Join 2 different data
activity <- merge(Y_combine, activities, by="activity_id")

# merge data frames of different columns
tidy_data <- cbind(subject, filtered_X_combine, activity)
#export data to text file
write.table(tidy_data, "tidy_data.txt")

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
melt_data <- melt(tidy_data, id = c("subjectId", "activity_label"))
new_melt_data <- dcast(melt_data, subjectId + activity_label ~ variable, mean)
write.table(new_melt_data, "new_melt_data.txt", row.names = FALSE)