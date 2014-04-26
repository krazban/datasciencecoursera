# Final Getting and Cleaning Data Project
# Author: Kourosh Razban
# File Name: run_analysis.R 
# Input File:"getdata_projectfiles_UCI HAR Dataset.zip"
# ========================================================
# File download

if (!file.exists("data")){
  dir.create("data", showWarnings=F)
}

file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

file.name <- basename(file.url)

#clean up the data file name
file.name <- gsub("%2F","_",
                  gsub("%20",' ',file.name))


samsung.data <- paste('data', file.name,sep='/')

#check before download.
if (!file.exists(samsung.data)){

  download.file(file.url, samsung.data, method="curl")
    
}


# Read the column and activity lables
#-----------------------------------

features <- read.table(unz(samsung.data, "UCI HAR Dataset/features.txt"))

activity.lables <-read.table(unz(samsung.data,"UCI HAR Dataset/activity_labels.txt"))

activity.lables[[2]] <- gsub("_",".",tolower(activity.lables[[2]]))

# Read the test data and create the test dataset.
#-----------------------------------------------
subject.ids <- read.table(unz(samsung.data, "UCI HAR Dataset/test/subject_test.txt"))

x.test.dt <- read.table(unz(samsung.data, "UCI HAR Dataset/test/X_test.txt"))

y.test.dt <- read.table(unz(samsung.data, "UCI HAR Dataset/test/y_test.txt"))

# find the activtiy names from activity code keys.
activities <- tolower(activity.lables[[2]][y.test.dt$V1]) 

test.ds <- cbind(subject.ids, activities, y.test.dt, x.test.dt)


# Read the training data and combine to create the training dataset.
#-------------------------------------------------------------------

subject.ids <- read.table(unz(samsung.data, "UCI HAR Dataset/train/subject_train.txt"))

x.train.dt <- read.table(unz(samsung.data, "UCI HAR Dataset/train/X_train.txt"))

y.train.dt <- read.table(unz(samsung.data, "UCI HAR Dataset/train/y_train.txt"))

activities <- (activity.lables[[2]][y.train.dt$V1])

train.ds <- cbind(subject.ids, activities, y.train.dt, x.train.dt)                  

# Combining the test and training datasets to create a complete set.
# Add the column lables to the newly created dataset.
#----------------------------------------------------------
complete.ds <- rbind(train.ds, test.ds)

colnames(complete.ds) <- c("subject.id", "activity","activity.code", as.character(features$V2) )


# column selection
# select the lables that contains mean and std. these column names
# will be applid to extract the matching columns from the complete dataset.
# it willproduce 79 names. It will exclude the angle variables
#--------------------------------------------------------------------------
selected.cols <- features[grepl("^[f|t]+.+[M|m]ean|std",
                                as.character(features$V2)), ]

selected.ds <- complete.ds[,c("subject.id", "activity", "activity.code", as.character(selected.cols$V2))]

selected.ds <- selected.ds[order(selected.ds[, 1], selected.ds[, 2]), ]

nrow(selected.ds)

ncol(selected.ds)

## Tidy Data aggregation  : aggtidyds
# aggregate the feature columns by activity for each subject.
# feature columns start at column 4.
# The final  aggregated dataset. The size of dataset: 
#                                30(subjects)X6(activties)=180 rows
# 79 selected features+ 3(subjectid,activity,activitycode)=82  columns
#------------------------------------------------------------------- 
agg.tidy.ds <- aggregate(x= selected.ds[, 4:ncol(selected.ds)],
                         by= list(subject.id= selected.ds$subject.id,
                                  activity= selected.ds$activity,
                                  activity.code= selected.ds$activity.code), FUN="mean")

# reorder the dataset for each subject.
agg.tidy.ds <- agg.tidy.ds[order(agg.tidy.ds$subject.id, agg.tidy.ds$activity.code),]

#tidy up the column names
#-----------------------
names(agg.tidy.ds)<- gsub("\\.{2}","\\.", 
                         gsub('([[:upper:]])', '.\\1',                                    
                              gsub("-", "\\.",     
                                   gsub("\\(\\)", "", names(agg.tidy.ds)))))

names(agg.tidy.ds) <- tolower(names(agg.tidy.ds))
nrow(agg.tidy.ds)
ncol(agg.tidy.ds)
write.table(agg.tidy.ds,file="data/samsungtidyds.txt")

#--------- END-----------------

