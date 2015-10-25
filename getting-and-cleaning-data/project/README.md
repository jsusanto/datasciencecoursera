How to Run run_analysis.R
1. Place and set your working directory

2. Variables:
 * subject_test   : used to store data read from subject_test.txt
 * subject_train  : used to store data read from subject_train.txt
 * subject        : combination from subject_test and subject_train
 
 * features       : used to store data read from features.txt.txt
 * index_mean_std : used to store data that has 'mean' 'std' on the label
 
 * activities     : used to store data read from activity_labels.txt.txt
 * X_test         : used to store data read from X_test.txt
 * X_train        : used to store data read from X_train.txt
 * X_combine      : used to store data combined from X_test and X_train
 * filtered_X_combine : it stores filtered data based on index_mean_std because we are only interested in certain columns
 
 *Y_test    : used to store data read from Y_test.txt
 *Y_train   : used to store data read from Y_train.txt
 *Y_combine : combination between Y_test and Y_train
 
 *activity  : join between Y_combine, activities using activity_id as the reference
 
 *tidy_data : combination between subject, filtered_x_combine, and activity


3. How to run 
   >source("run_analysis.R")
   code will export 2 files (tidy_data.txt and new_melt_data.txt)   