The tidy data set is generated by the function tidySet().
This function calls the helper functions:
file_loc()
measurements()
features()

To use the tidySet() function the workspace must  be set to the
directory that contains the  'UCI HAR Dataset' sub -directory. The
function creates a flat file tidySet.txt in the workspace directory
and returns the tidy data set as a data frame for further processing.