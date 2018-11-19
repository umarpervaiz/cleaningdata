library(dplyr)
library(data.table)
library(stringr)


#features list
features  <- fread("features.txt")


data.train.x <- fread("X_train.txt", header = F)
data.train.y <- fread("y_train.txt", header = F)
data.train.subject <- fread("subject_train.txt", header = F)

data.test.x <- fread("X_test.txt", header = F)
data.test.y <- fread("y_test.txt", header = F)
data.test.subject <- fread("subject_test.txt", header = F)

#Training Dataset
data.train <- data.frame(data.train.subject, data.train.y, data.train.x)

#Test Dataset
data.test <- data.frame(data.test.subject, data.test.y, data.test.x)

colnames(data.train) <- c("subject", "activity", t(features[,2]))
colnames(data.test) <- c(c("subject", "activity"), t(features[,2]))


#Q1 Merge = Final Dataframe 
data.all <- rbind(data.train, data.test)

#Q2 Mean and Standard Deviations
mean_std <- grep("mean|std",colnames(data.all))
data.subset <- data.all[,c(1,2,mean_std)]

#Q3 
activity.names <- fread("activity_labels.txt", col.names = c("class_labels", "Activity_Description"))
label <- merge(data.subset, activity.names, by.x = "activity", by.y = "class_labels")

#Q4
Final_data_1 <- select(label, activity, subject, Activity_Description, everything())
write.table(Final_data_1, "Final_data_1.txt", row.names = F)

#Q5
group_mean <- group_by(Final_data_1, subject, Activity_Description) %>% summarise_all(mean)
write.table(group_mean, "Final_data_2.txt", row.names = F)
