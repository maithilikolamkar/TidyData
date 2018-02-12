#Check if file has been downloaded and extracted already else load it

if (!file.exists('raw_data')){
  dir.create('raw_data')
} else {
  print('File exists')}
if (!file.exists('./raw_data/raw_data.zip')) {
  filepath <-
    'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  download.file(filepath, './raw_data/raw_data.zip')
} else {
  print('Zip exists')}
if (!file.exists('./raw_data/UCI HAR Dataset'))
{
  unzip('./raw_data/raw_data.zip', exdir = './raw_data')
} else {
  print("Folder exists")}

#Read feature file
features <- read.table('./raw_data/UCI HAR Dataset/features.txt')
head(features)

#Read activity_lables file
activity_labels <-
  read.table(
    './raw_data/UCI HAR Dataset/activity_labels.txt',
    col.names = c('Label No.', 'Activity Label')
  )
head(activity_labels)

#Read Test tables

subject_test <-
  read.table('./raw_data/UCI HAR Dataset/test/subject_test.txt',
             col.names = 'Subject')
head(subject_test)

X_test <-
  read.table('./raw_data/UCI HAR Dataset/test/X_test.txt', col.names = features$V2)
head(X_test)

y_test <-
  read.table('./raw_data/UCI HAR Dataset/test/y_test.txt', col.names = 'Label No.')
head(y_test)
Test_Set <- cbind(subject_test, y_test, X_test)

head(Test_Set)

#Read train tables
subject_train <-
  read.table('./raw_data/UCI HAR Dataset/train/subject_train.txt',
             col.names = 'Subject')
head(subject_test)

X_train <-
  read.table('./raw_data/UCI HAR Dataset/train/X_train.txt', col.names = features$V2)
head(X_test)

y_train <-
  read.table('./raw_data/UCI HAR Dataset/train/y_train.txt', col.names = 'Label No.')
head(y_test)

#combine columns from three files
Train_Set <- cbind(subject_train, y_train, X_train)

head(Train_Set)

#Merge train and test data
Merged_Set <- rbind(Test_Set, Train_Set)
head(Merged_Set)


#Get column numbers for Mean and Standard Deviation columns
set_columns <- colnames(Merged_Set)
mean_columns <- grep('mean\\.', set_columns)
std_columns <- grep('std', set_columns)

#Extract Data from the columns returned for mean and SD
Data_Extract <- Merged_Set[, c(mean_columns, std_columns)]
head(Data_Extract)

#Use activiy_labels data set to name activities in merged set
Merged_Set_Labels <- merge(activity_labels, Merged_Set)
head(Merged_Set_Labels)

#Use read me file to rename variable names
col_names <- colnames(Merged_Set_Labels)
head(col_names)
col_names <- sub('^t', 'Time of ', col_names)
col_names <- sub('^f', 'Frequency of ', col_names)
col_names <- sub('Acc', ' Acceleration ', col_names)
col_names <- sub('Gyro', ' Angular Velocity ', col_names)
col_names <- sub('BodyBody', 'Body', col_names)
col_names <- sub('Mag', ' Magnitude', col_names)
col_names
colnames(Merged_Set_Labels) <- col_names
head(Merged_Set_Labels)

#Create a new dataset with averages of all variables for all activities and subjects
Agg_Set <-
  aggregate(
    Merged_Set_Labels[, 4:564],
    by = list(Merged_Set_Labels$Activity.Label, Merged_Set_Labels$Subject),
    mean
  )
head(colnames(Agg_Set))
colnames(Agg_Set)[1]<-'Activity'
colnames(Agg_Set)[2]<-'Subject'
#Final Output
write.table(Agg_Set,'./Tidy_Output_Set.txt')


