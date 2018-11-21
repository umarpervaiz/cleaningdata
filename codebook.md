
The data in the "Human Activity Recognition Using Smartphones Dataset" were collected from the accelerometers from the Samsung Galaxy S smartphone. They have been taken from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing his smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz data were captured. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. (references to UCI Machine Learning Repository)

All the codes to conduct analysis and get tidy data in text file are present in run_analysis.R script

Step #1 
Unzip the data file which was present in different segments, different raw data files that were present in zipped file included

'features.txt': List of all features

'activity_labels.txt': List of class labels and their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'train/subject_train.txt': ID's of subjects in the training data

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

'test/subject_test.txt': ID's of subjects in the training data

Step #2 
Run the codes in run_analysis.R script that merges data from all the raw data txt files to produce a tidy data txt file

First it reads all required .txt files and labels the datasets

Consequently the appropriate "activity_id"'s and "subject_id"'s are appended to the "test" and the "training" data, which are then combined into one single data frame

Using the "grep" function, all the columns with mean() and std() values are extracted and then a new data frame, including only the "activity_id", the "subject_id" and the mean() and std() columns, is created

Using the "select" function, descriptive activity names are merged with the mean/std values dataset, to get one dataset with descriptive activity names

'group' function is being used to find the average value for each of the variables and each subject 

 Whereas, two data files are created, 'Final_data_1' which contains the tidy data with the mean/std along with their descriptive activities
 
 While the other file 'Final_data_2' contains the average of each variable for each activity and for each subject
 
 Both the final files are created by 'write.table' function
