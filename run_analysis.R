## Read the data sets, as.is was used to prevent character vectors turned to factors
features <- read.table("features.txt", as.is=T)
X_test <- read.table("X_test.txt")
X_train <- read.table("X_train.txt")
y_test <- read.table("y_test.txt")
y_train <- read.table("y_train.txt")
subject_test <- read.table("subject_test.txt")
subject_train <- read.table("subject_train.txt")

## Clean the features table by removing hyphens, commas and parantheses
features[, 2] <- gsub("-", "", features[, 2])
features[, 2] <- gsub(",", "", features[, 2])
features[, 2] <- sub("\\(\\)", "", features[, 2])

## Replace "t" with time to provide additional readability 
features[, 2] <- sub("(^t)", "time", features[, 2])

## Replace "f" with frequency to provide additional readability 
features[, 2] <- sub("(^f)", "frequency", features[, 2])

## Combine the X_train and X_test datasets into 1
combined.data <- rbind(X_train, X_test)

## Use cleaned features as variable names in combined data
names(combined.data) <- features[, 2]

## Separate "mean" columns from the combined data
mean.data <- combined.data[, grep("([Mm]ean)", names(combined.data))]

## Separate "std" (standard deviation) columns from combined data
stdev.data <- combined.data[, grep("([Ss]td)", names(combined.data))]

## Combine the mean and standard deviation files to form 1 data frame
mean.std <- cbind(mean.data, stdev.data)

## Combine the y_train and y_test data (activity data) note rbind must be done 
## must be applied in the same order as X_train and X_test combine
combined.activity <- rbind(y_train, y_test)

## Assign meaning full names to "y" the activity data and label the activity column
combined.activity$V1[combined.activity==1] <- "walking"
combined.activity$V1[combined.activity==2] <- "walking_upstairs"
combined.activity$V1[combined.activity==3] <- "walking_downstairs"
combined.activity$V1[combined.activity==4] <- "sitting"
combined.activity$V1[combined.activity==5] <- "standing"
combined.activity$V1[combined.activity==6] <- "laying"
names(combined.activity) <- "activity"

## Combine the activity data to the mean & standard deviation data 
mean.std <- cbind(combined.activity, mean.std)

## Combine the "subject" train and test data and combine to data frame
combined.subject <- rbind(subject_train, subject_test)
names(combined.subject) <- "subject_id"
mean.std <- cbind(combined.subject, mean.std)

## Calculate the mean by subject and by activity and put in new data frame
## first turn subject_id and activity into factor variables, once calculated rename
## the first two columns of the new data frame accordingly
mean.std$subject_id <- as.factor(mean.std$subject_id)
mean.std$activity <- as.factor(mean.std$activity)

mean.data <- aggregate(mean.std[, 3:81], by=list(mean.std$subject_id, mean.std$activity), FUN=mean)
names(mean.data)[1:2] <- c("subject_id", "activity")

## write the data frame to a new file summaryMeans.txt
write.table(mean.data, "summaryMeans.txt")

