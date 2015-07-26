
library(dplyr)

#Read in activities and features labels
acts<-read.table(".\\HAR data\\UCI HAR Dataset\\activity_labels.txt")
feats<-read.table(".\\HAR data\\UCI HAR Dataset\\features.txt")

#Read in training records and subjects and activity ids
recs_train<-read.table(".\\HAR data\\UCI HAR Dataset\\train\\X_train.txt")
labs_train<-read.table(".\\HAR data\\UCI HAR Dataset\\train\\y_train.txt")
subjs_train<-read.table(".\\HAR data\\UCI HAR Dataset\\train\\subject_train.txt")

#Read in test records and subjects and activity ids
recs_test<-read.table(".\\HAR data\\UCI HAR Dataset\\test\\X_test.txt")
labs_test<-read.table(".\\HAR data\\UCI HAR Dataset\\test\\y_test.txt")
subjs_test<-read.table(".\\HAR data\\UCI HAR Dataset\\test\\subject_test.txt")

#Merge test and training datasets
recs_merged <-rbind(recs_train, recs_test)
labs_merged <-rbind(labs_train, labs_test)
subjs_merged <-rbind(subjs_train, subjs_test)

#Add descriptive names to datasets from features table
colnames(recs_merged)<-feats[,2]

#Adds descriptive activity names from activity labels table
labs_full<-inner_join(x=labs_merged, y=acts, by = c("V1"="V1"), sort=FALSE)

#Combine records and subjects/activities
recs_labelled<-cbind(subjs_merged, labs_full, recs_merged)
colnames(recs_labelled)[1:3]<-c("Subject","ActID", "Activity")

#Extract means and stand deviations for all measurements
recs_filtered<-recs_labelled[,grep("mean|std|Subject|Activity", names(recs_labelled))]

#Create tidy data table
final<-(recs_filtered %>% group_by(Subject, Activity)%>% summarise_each(funs(mean)))
