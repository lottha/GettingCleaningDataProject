file_loc <- function(){
# 	utility function that returns location of data sets	
	path1 <- './UCI HAR Dataset/test/'
	path2 <- './UCI HAR Dataset/train/'
  
	return (c(path1, path2))
}

measurements <- function(){
#	function to return a data frame with combined test and training feature measurements
	path <- file_loc()
	
	# read the two data sets
	dat1 <- read.table(paste(path[1], 'X_test.txt', sep = ''), header = FALSE, colClasses= 'numeric')
	dat2 <- read.table(paste(path[2], 'X_train.txt', sep = ''), header = FALSE, colClasses= 'numeric')
	
	# concatenate the data sets
	datf <- rbind(dat1, dat2)
 
	# return combined data set
	return (datf)
}

features <- function(){
#	function to return a data frame of features which correspond to measurements of mean and standard deviation 
	root <- './UCI HAR Dataset/'
	
	# read feature list
	features <- read.table(paste(root, 'features.txt', sep = ''), header = FALSE, colClasses = c('integer', 'character'))
	colnames(features) <- c('featureIdx', 'featureDesc')
	# identify index of features corresponding to measurement of mean
	meanRows <- grep('mean()', features[,2], fixed=TRUE)
	# identify index of features corresponding to measurement of standard deviation
	stdRows <- grep('std()', features[,2], fixed=TRUE)
	# select subset of features corresponding to measurement of mean or standard deviation
	features <- features[c(meanRows, stdRows), ]
  
	# return list of features corresponding to measurement of mean or standard deviation
	return (features)
}

tidySet <- function(){
#	function to create a tidy data set. Writes the dataset to file and returns the tidy set as a data frame
	root <- './UCI HAR Dataset/'
	path <- file_loc()
  
	# read list of activity descriptions
	actLabels <- read.table(paste(root, 'activity_labels.txt', sep = ''), header = FALSE)
	colnames(actLabels) <- c('actId', 'actDesc')
  
	# read list of subjects in test and training datasets
	subject1 <- read.table(paste(path[1], 'subject_test.txt', sep = ''), header = FALSE)
	subject2 <- read.table(paste(path[2], 'subject_train.txt', sep = ''), header = FALSE)
  
	# read list of activities (by index) in test and training data sets
	act1 <- read.table(paste(path[1], 'y_test.txt', sep = ''), header = FALSE)
	act2 <- read.table(paste(path[2], 'y_train.txt', sep = ''), header = FALSE)
  
	# combine test and training data sets (subjects and activities)
	subject <- rbind(subject1, subject2)
	colnames(subject) <- c('subjectId')
	act <- rbind(act1, act2)
	colnames(act) <- c('actId')
	# join activities data set and activity descriptions
	act <- merge(actLabels, act, by.x = 'actId', by.y = 'actId')
  
	# get measurements and features using helper functions
	data <- measurements()
	features <- features()
  
	# extract columns of measurements of mean and standard deviation
	data <- data[, features$featureIdx]
	colnames(data) <- features$featureDesc
  
	# combine subjects, activities and feature measurements into one data frame
	df <- cbind(subject, act, data)
	
	# calculate mean of measurements by subject and activity
	df_mean <- aggregate(df[, c(-1,-2,-3)], by = list(subjectId = df$subjectId, actId = df$actId, actDesc = df$actDesc), mean)
  
	# write result set into a file
	write.table(res, file='tidySet.txt', row.names = FALSE)
  
	# return result set for testing purposes
	return (df_mean)
}

