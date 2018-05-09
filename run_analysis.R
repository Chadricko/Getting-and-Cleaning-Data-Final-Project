library(plyr)
library(dplyr)
library(tidyr)

##import variable data:

featuresDF <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
activityLabelsDF <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

##import Train Observations:

subjectTrainDF <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
xTrainDF <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
yTrainDF <- read.table("./UCI HAR Dataset/train/Y_train.txt", header = FALSE)


##Assign feature names to xTRainDF Columns:

a <- featuresDF$V2
counter <- 1
for (i in a){
  names(xTrainDF)[counter] <-paste(i)
  counter <- counter+1
}

##Assign feature name to yTRainDF Column:

names(yTrainDF)[1] <-paste("Activity")

##Assign feature name to subjectTrainDF Column:

names(subjectTrainDF)[1] <-paste("Subject")

## combine test folder dataFrames into one organized dataFrame:

myTrainDF <- cbind(xTrainDF, yTrainDF,subjectTrainDF)

##import Test observations:

subjectTestDF <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
xTestDF <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
yTestDF <- read.table("./UCI HAR Dataset/test/Y_test.txt", header = FALSE)

##Assign feature names to xTRainDF Columns:

a <- featuresDF$V2
counter <- 1
for (i in a){
  names(xTestDF)[counter] <-paste(i)
  counter <- counter+1
}

##Assign feature name to yTestDF Column:

names(yTestDF)[1] <-paste("Activity")

##Assign feature name to subjectTestDF Column:

names(subjectTestDF)[1] <-paste("Subject")

## combine Test dataFrames into one organized dataFrame:

myTestDF <- cbind(xTestDF, yTestDF,subjectTestDF)

##Combine Test and Train DataFrames:

myFinalDF <- rbind(myTrainDF,myTestDF)

## Make Activity Labels Descriptive:

activityLabelVector <- activityLabelsDF$V2
counter <- 1
for (i in activityLabelVector){
  myFinalDF$Activity[myFinalDF$Activity == counter] <- i
  counter = counter+1
}

## Extract only the measurements on the mean and
## standard deviation for each measurement: 

stdcols<- grep('[Ss]td',colnames(myFinalDF))
meancols<- grep('\\bmean\\b',names(myFinalDF))
myTrueDF <- myFinalDF[,c(stdcols,meancols, 562,563)]

## Make column names more human level descriptive:

names(myTrueDF)<- paste(sub("^f", "Frequency ", names(myTrueDF)))
names(myTrueDF)<- paste(sub("^t", "Time ", names(myTrueDF)))
names(myTrueDF)<- paste(sub('[Aa]cc', "Accelerometer ", names(myTrueDF)))
names(myTrueDF)<- paste(sub('[Gg]yro', "Gyroscope ", names(myTrueDF)))
names(myTrueDF)<- paste(sub("[Mm]ag", "Magnitude ", names(myTrueDF)))
names(myTrueDF)<- paste(gsub("[Bb]ody", "Body ", names(myTrueDF)))
names(myTrueDF)<- paste(sub("[Gg]ravity", "Gravity ", names(myTrueDF)))
names(myTrueDF)<- paste(sub("[Jj]erk", "Jerk ", names(myTrueDF)))
names(myTrueDF)<- paste(sub("-std()", "Standard Deviations", names(myTrueDF)))
names(myTrueDF)<- paste(sub("-mean()", "Means", names(myTrueDF)))
names(myTrueDF)<- paste(sub("[(]", "", names(myTrueDF)))
names(myTrueDF)<- paste(sub("[)]", "", names(myTrueDF)))

## Break up and reform Data into independent tidy data set 
## with the average of each variable for each activity and 
## each subject:

myTrueDF <- arrange(myTrueDF, Subject)
k <- activityLabelsDF[,2]
counter1 <- 1
DFQ5<-  filter(myTrueDF, Activity == "The Hustle")
for (i in k){
   for (h in 1:30){
      temp <- filter(myTrueDF, Activity == i & Subject == h)
      z<- colwise(mean)(temp)
      z$Activity <- i
      DFQ5 <- rbind(DFQ5,z)
        
      
    }
}
## Change feature descriptions to reflect Data:

names(DFQ5)<- paste(sub("Frequency ", "Mean of Frequency ", names(DFQ5)))
names(DFQ5)<- paste(sub("Time ", "Mean of Time ", names(DFQ5)))

