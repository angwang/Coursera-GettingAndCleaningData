#Set working directory where Samsung data is loaded
setwd("~/Google Drive")
#Part 1------------------------------
#Read features table containing names of measurements
features<-read.table("UCI\ HAR\ dataset/features.txt", header=FALSE)
#Read Test population activity values
xTest<-read.table("UCI\ HAR\ dataset/test/X_test.txt", header=FALSE)
#Read Test population activity labels
yTest<-read.table("UCI\ HAR\ dataset/test/y_test.txt", header=FALSE)
#Read Training population activity values
xTrain<-read.table("UCI\ HAR\ dataset/train/X_train.txt", header=FALSE)
#Read Training population activity labels
yTrain<-read.table("UCI\ HAR\ dataset/train/y_train.txt", header=FALSE)

#Combine all (Test and Training) activity measurements
measurements<-rbind(xTest, xTrain)
#Combine all (Test and Training) activity labels
labels<-rbind(yTest, yTrain)
#Read the activity names
activityLabels<-read.table("UCI\ HAR\ dataset/activity_labels.txt", header=FALSE)
#join the activity codes with the labels
joinedLabels<-join(labels, activityLabels)

#Write column names for the activity measurements
colnames(measurements)<-features$V2

#Read the subject IDs that produced the activity measured in x_test
subjectTest<-read.table("UCI\ HAR\ dataset/test/subject_test.txt", header=FALSE)
subjectTrain<-read.table("UCI\ HAR\ dataset/train/subject_train.txt", header=FALSE)
subjects<-rbind(subjectTest, subjectTrain)

#Combine Subject IDs and activity labels with subject measurements
combined<-cbind(Subject=subjects$V1, Activity=joinedLabels$V2, measurements)

#Part2----------------------------
#Find column names with "-mean" and "-std"
grep( "-[Mm]ean|-[Ss]td",names(combined))

#Keep only columns with mean and std calculations
mean_std<-cbind(Subject=combined$Subject, Activity=combined$Activity,
                combined[grep( "-[Mm]ean|-[Ss]td",names(combined))])

#Part3----------------------------
#Replace "t" at beginning of variable names with "time"
names(mean_std)<-sub("^t","time", names(mean_std))
#Replace "f" at beginning with "freq"
names(mean_std)<-sub("^f","freq", names(mean_std))
#Replace "BodyBody" at beginning with "Body"
names(mean_std)<-sub("BodyBody","Body", names(mean_std))

#Part4----------------------------
#remove "()" from variable names
names(mean_std)<-sub("Mean\\(\\)","Mean", names(mean_std))
names(mean_std)<-sub("-std\\(\\)","Std", names(mean_std))
names(mean_std)<-sub("Freq\\(\\)","Freq", names(mean_std))
#remove "-"
names(mean_std)<-sub("-","", names(mean_std))


#Part5----------------------------
#Calculate Mean of each variable for each subject and activity
aggMean<-aggregate(.~Subject + Activity, data=mean_std, FUN=mean)
#Add "Average of" to the measurment labels (column names)
names(aggMean)[3:ncol(aggMean)]<-sub("^","AverageOf", names(aggMean)[3:ncol(aggMean)])

#Write out this tidy data
write.csv(aggMean, file = "AverageActivityMeasurements.csv")
