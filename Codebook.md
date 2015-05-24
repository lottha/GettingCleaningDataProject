Data:
Raw data used in this project originates from the
'Human Activity Recognition Using Smartphones Dataset' research project:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
A Public Domain Dataset for Human Activity Recognition Using Smartphones. 
21th European Symposium on Artificial Neural Networks, 
Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

The research project description and the data sources are available from the following website:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The following data files were used:
- 	'features.txt': List of all features.
- 	'activity_labels.txt': Links the class labels with their activity name.
- 	'train/X_train.txt': Training features set.
- 	'train/y_train.txt': Training activity labels.
- 	'test/X_test.txt': Test features set.
- 	'test/y_test.txt': Test activity labels.
- 	'test/subject_test.txt': Test subjects
- 	'train/subject_train.txt': Training subjects

Data Transformation:
1.	read activity training and test labels and join with activity names.
2.	read and combine the activity label training and test sets.
3.	read and combine the subject training and test sets.
4.	join combined activity label set with activity names
5. 	read and combine the features training and test sets.
6. 	read list of all features and identify features corresponding to measurement of mean and standard deviation.
7.	generate index vector containing the position of those measurements in the feature list.
8.	extract columns of measurements of mean and standard deviation from the combined features set
9.	combine subjects, activities and extracted feature measurements into one data frame (df)
10.	using the aggregate function on the df dataframe calculate mean of measurements by subject and activity
11.	the result of the last step is the tidy dataset.write the result to file.

 
