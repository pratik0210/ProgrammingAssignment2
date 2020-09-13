library(reshape2)
#reading of features and activity data
features <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")



#reading of train datasets
train <- read.table("./UCI HAR Dataset/train/X_train.txt")    
colnames(train) <- features$V2                                   #setting column names for data
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")      #activity labels
train$activity <- y_train$V1
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") #reading subjects
train$subject <- factor(subject_train$V1)                             #adding column names as subject


#reading of test datasets
test <- read.table("./UCI HAR Dataset/test/X_test.txt")       #reading main data 
colnames(test) <- features$V2                                 # setting column names
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt") 
test$activity <- y_test$V1                                    # activities
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test$subject <- factor(subject_test$V1)                       # column for Subjects


# we have two data frames train and test 


#merging train and test dataframes 

data <- rbind(test, train) 

##Extracts only the measurements on the mean and standard deviation for each measurement.
column.names <- colnames(data)
mean_sd_filter <- grep("std\\(\\)|mean\\(\\)|activity|subject", column.names, value=TRUE)
filtered_data <- data[, mean_sd_filter] 

#Descriptive values for activity labels 
filtered_data$activitylabel <- factor(filtered_data$activity, labels= c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

#creating a tidy dataset with mean values
featurescolnames = grep("std\\(\\)|mean\\(\\)", column.names, value=TRUE)
datasetmelt <-melt(filtered_data, id = c('activitylabel', 'subject'), measure.vars = featurescolnames)
tail(datasetmelt,3)
tidy_data <- dcast(datasetmelt, activitylabel + subject ~ variable, mean)       #average

##creating tidy data file  
write.table(tidy_data, file = "tidydataset.txt", row.names = FALSE)
