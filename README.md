
```{r cars}
The following files from the initial dataset is used:

features.txt - includes the descriptions for features measured
train/X_train.txt - includes the measurements of the features in train set (one row - 1 measurement of 561 features)
test/X_test.txt - includes the measurements of the features in test set
train/subject_train.txt - subject for each measurement from the train set
test/subject_test.txt - subject for each measurement from the test set
train/y_train.txt - activity (from 1 to 6) for each measurement from the train set
test/y_test.txt - activity (from 1 to 6) for each measurement from the test set





Script involves the following stages:

a. Firstly loads the measurements from X_train.txt as a data frame
b. For these data frame column names are updated to be more user friendly using features description.

c. activity labels and subjects for measurements are also loaded from files train/y_train.txt and train/subject_train.txt and added to data frame as a separated columns.

Similar steps are made for test dataset 
We get two data frames 

 ---Merge the training and the test sets to create one data set of assignment

---- Extract only the measurements on the mean and standard deviation for each measurement of assignment 

----Use descriptive activity names to name the activities in the data set of assignment


Creates a melted data frame using activity label and subject as ids, after that mean values for all variables are calculated grouped by activity and subject using dcast() function and tidy data frame is created.

----- Create a second, independent tidy data set with the average of each variable for each activity and each subject)
```
