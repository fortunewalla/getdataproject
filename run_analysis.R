####Part 1. DOWNLOAD & UNZIP DATASET
# Downloading the .zip file.
# Modify directory & filenames structure for your own needs.

setwd('~/getdata')
# Checks if .ZIP already downloaded. This saves time when running
# the code multiple number of times.
fileName <- './proj/getdata_projectfiles_UCI HAR Dataset.zip'

if(!file.exists(fileName)) {
  fileURL<- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  download.file(fileURL,destfile=fileName,method="curl")
}

dsDir<-'./proj/UCI HAR Dataset'

if(!file.exists(dsDir)){
  unzip(fileName,exdir='./proj')
  }
setwd(dsDir)
  
####Part 2. GETTING DATA SETS INTO R.

#ACTIViTY_LABELS: DIM = 6 X 2
al<-read.table('activity_labels.txt')
names(al)<-c('ACTIVITY_ID','ACTIVITY_LABEL')

#FEATURES_LABELS: DIM= 561 X 2
fe<-read.table('features.txt')
names(fe)<-c('FEAT_ID','FEAT_LABEL')

#TRAIN_LABEL: DIM= 7352 X 1
trainl<-read.table('train/y_train.txt')
names(trainl)<-c('ACTIVITY_ID')

#TRAIN_SET: DIM= 7352 X 561
trainset<-read.table('train/X_train.txt')

#SUBJECT_TRAIN:DIM= 2947 X 1
subjtrain<-read.table('train/subject_train.txt')
names(subjtrain)<-c('SUBJECT_ID')

#TEST_LABEL: DIM= 2947 X 1
testl<-read.table('test/y_test.txt')
names(testl)<-c('ACTIVITY_ID')

#TEST_SET: DIM=2947 X 561
testset<-read.table('test/X_test.txt')

#SUBJECT_TEST:DIM= 2947 X 1
subjtest<-read.table('test/subject_test.txt')
names(subjtest)<-c('SUBJECT_ID')


####Part 3: Combine Train & Test Data Sets. TRAIN_SET & TEST_SET
# Since they contain the same columns, we combine them by joining
# the rows.

combinedset<-rbind(testset,trainset)
names(combinedset)<-fe$FEAT_LABEL

combinedsubjectid<-rbind(subjtest,subjtrain)

combinedactivityid<-rbind(testl,trainl)


####Part 4: Using descriptive activity to name the activities in the data set.
# Here we use the description given by the plyr join() preserves order.

library(plyr)
cactidlabel<-join(combinedactivityid,al)


####Part 5: Merging all the columns into one single data set.

cs<-cbind(combinedsubjectid,cactidlabel,combinedset)


####Part 6: Extracts only the measurements on the
# mean and standard deviation for each measurement. 

reducedCols <- grep("mean|std|ACTIVITY|SUBJECT", names(cs))

cs <- cs[,reducedCols]


####Part 7: Appropriately labels the data set with descriptive variable names. 

# For Labels, 
# tBodyAcc-max()-Z becomes T_BODYACC_MAX_Z

# 
names(cs) <- gsub(pattern="mean", replacement="MEAN", names(cs))
names(cs) <- gsub(pattern="std", replacement="STD", names(cs))
names(cs) <- gsub(pattern="[-]", replacement="_", names(cs))
names(cs) <- gsub(pattern="[()]", replacement="", names(cs))
names(cs) <- gsub(pattern="fBody", replacement="F_BODY", names(cs))
names(cs) <- gsub(pattern="tBody", replacement="T_BODY", names(cs))
names(cs) <- gsub(pattern="tGravity", replacement="T_GRAVITY", names(cs))
names(cs) <- gsub(pattern="tGravity", replacement="T_GRAVITY", names(cs))

names(cs) <- gsub(pattern="BodyGyro", replacement="_BODYGYRO", names(cs))
names(cs) <- gsub(pattern="Acc", replacement="_ACC", names(cs))
names(cs) <- gsub(pattern="Jerk", replacement="JERK", names(cs))
names(cs) <- gsub(pattern="Mag", replacement="MAG", names(cs))
names(cs) <- gsub(pattern="Freq", replacement="FREQ", names(cs))
names(cs) <- gsub(pattern="Gyro", replacement="_GYRO", names(cs))
names(cs) <- gsub(pattern="Body", replacement="_BODY", names(cs))

####Part 8: Melting the dataset i.e. shaping the data set 
#     so that it is sorted by subject_id & activity_label
# melt() sorts the dataset & dcast() rearranges the dataset while caculating the mean.

library(reshape2)
csmelt <- melt(data=cs, id=c("SUBJECT_ID", "ACTIVITY_LABEL"))

cstidy <- dcast(data=csmelt, SUBJECT_ID + ACTIVITY_LABEL ~ variable, mean)

####Part 9: The final reduced tidy dataset is written to an output file.

write.table(cstidy,file="tidydata.txt",row.names=FALSE)


####
