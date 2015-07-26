# Loading Separate Datasets
test <- read.csv('data/test/X_test.txt', sep="", header=F)
test_features <- read.csv('data/features.txt', sep="",  header=F)
train <- read.csv('data/train/X_train.txt', sep="", header = F)
subject_test <- read.csv ('data/test/subject_test.txt', sep="", header=F)
activities_test <- read.csv ('data/test/y_test.txt', sep="", header = F)
subject_train <- read.csv ('data/train/subject_train.txt', sep="", header = F)
activities_train <- read.csv ('data/train/y_train.txt', sep="", header= F)
# Combining Columns for test
names(test)<- test_features$V2
test_dataset <- data.frame(subject_test, activities_test, test)
tbl_df(test_dataset)
colnames(test_dataset) [1] <- "subject"
colnames(test_dataset) [2] <- "activity"
test_dataset$grp <- 'test'
test_dataset <- subset(test_dataset, select =-test)
# Combining Columns for train
names(train)<-test_features$V2
train_dataset <-data.frame(subject_train, activities_train, train)
colnames(train_dataset) [1] <- "subject"
colnames(train_dataset) [2] <- "activity"
train_dataset$grp <- "train"
# Load Activity Labels
labels <- read.csv('data/activity_labels.txt', sep ="",header=FALSE)dt
colnames(labels) <- c("activity", "activity_name")
test_joined_dataset <- left_join (test_dataset, labels, by = NULL, copy = FALSE)
train_joined_dataset <- left_join (train_dataset, labels, by = NULL, copy= FALSE)
train_ordered <- train_joined_dataset[, c(1,2,565, 4:565)]
test_ordered <- test_joined_dataset[,c(1,2,565, 4:565)]
# Creating a single tidy dataset
f_dataset<- rbind(train_ordered,test_ordered)
# Only extract the measurements for the mean and standard deviation 
t_data <- f_dataset %>%
  select(subject,activity_name, contains (".mean"), contains ("std"))
# Cleaning up the variable names
colNames <- colnames(t_data); 


for (i in 1:length(colNames)) 
{
  colNames[i] = gsub("\\()","",colNames[i])
  colNames[i] = gsub("-std$","StdDev",colNames[i])
  colNames[i] = gsub("-mean","Mean",colNames[i])
  colNames[i] = gsub("^(t)","time",colNames[i])
  colNames[i] = gsub("^(f)","freq",colNames[i])
  colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
  colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
  colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
  colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
  colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
  colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
  colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
};
# Reasigning column names to final data
colnames(t_data) = colNames;

# Calculate mean and std dv for all combinations
grouped_data <- t_data %>%
group_by(subject,activity_name)%>%
summarise_each(funs(mean)) 
write.table(grouped_data, "tidy.txt", row.names = FALSE, quote = FALSE)



  
