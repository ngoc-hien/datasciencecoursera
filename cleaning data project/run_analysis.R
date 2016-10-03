# check and set working directory as "Samsung data"
# download and unzip the data set
if (dir.exists("Samsung data") == FALSE)
      dir.create("Samsung data")
setwd("./Samsung data")
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "Dataset.zip")
unzip("Dataset.zip")

# set data directories
directory <- "UCI HAR Dataset"
testdir <- "test"
traindir <-"train"
# read training and test sets and other files
feature.names <- read.table(file.path(directory, "features.txt"), header = F, sep = "")
activity.lables <- read.table(file.path(directory, "activity_labels.txt"), header = F, sep = "")
names(feature.names) <- c("code", "name")
names(activity.lables) <- c("code", "name")

subject.train <- read.table(file.path(directory, traindir, "subject_train.txt"), header = F, sep = "")
subject.test <- read.table(file.path(directory, testdir, "subject_test.txt"), header = F, sep = "")
x.train <- read.table(file.path(directory, traindir, "X_train.txt"), header = F, sep = "")
x.test <- read.table(file.path(directory, testdir, "X_test.txt"), header = F, sep = "")
y.train <- read.table(file.path(directory, traindir, "y_train.txt"), header = F, sep = "")
y.test <- read.table(file.path(directory, testdir, "y_test.txt"), header = F, sep = "")

# get variables estimated with mean and std
# by looking at the name of the feature
t <- grep("mean\\(|std\\(", feature.names[,2])
# combine training and test sets
# then set column names
data <- cbind(rbind(subject.train, subject.test), rbind(y.train, y.test), rbind(x.train[,t],x.test[,t]))
names(data) <- c("subject", "activity.code", as.character(feature.names[t,2]))
# merge with activity lables to get the labels
data <- merge(data, activity.lables, by.x = 2, by.y = 1)
names(data)[69] <- "activity.name"  # change the name of the last column
data <- data[, c(2,1,69,3:68)]      # reorder columns so that "subject", "activity.code", "activity.name", ...
write.table(data, "data1.txt", quote = F, row.names = F)

# calculate mean for each variable by subject and activity
data.mean <- data %>% group_by(subject, activity.name) %>% summarise_each(funs(mean))
names(data.mean)[4:69] <- paste("avg_", names(data)[4:69], sep = "")
write.table(data.mean, "data2.txt", quote = F, row.names = F)

# calculate quantiles for each numeric measure i.e. variable of columns 4-69
data.summary <- NULL
for(i in 4:69) data.summary <- rbind(data.summary, quantile(data[,i]))
row.names(data.summary) <- names(data)[4:69]
data.summary