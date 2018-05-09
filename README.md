# Getting-and-Cleaning-Data-Final-Project
John Hopkins and Coursera

     
   Section 1 of my Script imports the feature labels and the activity labels from the provided files.  The feature labels later become the 
names of the columns that hold the data they describe.  The activity labels will eventual be subbed in to the Activity column in place of the less human friendly number system that the tables came with.

Section 2 of my script is where I import all of the observation data that was used to train the model.  This data will eventually by combined with the observation data that was used to test the model created with the training data.  This will yield the entire original data set in a single data frame.  

Section 3 of my script is where I assign the appropriate labels to the columns of the data frame that represents the bulk of the observation data using a for loop.  The loop replaces the temporary names that were assigned to each column when the data frame was imported and compiled.  

In Section 4 of my script I replace the temporary column names of the two other imported data frames containing observation 
data from the training set.

In Section 5 of my script I combine the three data frames containing observation data from the training set to make a singular data frame of the observation data that was used for Training.  All column labels are also correct for this data frame.   

Section 6 is like Section 2, only the Test data is imported into data frames. 

Section 7 is like Section 3 only again for Test data not Train data.

Section 8 is like Section 4 but again, for data relevant to the Test set.

Section 9 is like Section 5 except here a data frame containing all of the relevant Test Data has been formed.

Section 10 is where using rbind I am able to combine the train set data frame and the test set data frame.  Now I will 
be able to manipulate the entire data set at once as a single data frame.

Section 11 is where I use a for loop and the activity labels data frame to replace the numbers representing the activity levels
with strings that communicate something more specific and meaningful to a human observer.

Section 12 is where I use grep and regular expressions to extract only those columns that contained  measurements 
of the mean and standard deviation for each measurement.  I placed these in a new data frame that I would later manipulate
 further and use to derive another more specific data frame. 

In Section 13 of my script I use a combination of sub and paste to alter the names of each of the columns of my chosen data set
so that it was more readable and understandable to a human - hopefully making the data frame more accessible for others
who come down the line.  

In Section 14 I break the previous data frame into smaller data frames that pertain to a particular activity of a particular subject using a for loop and the filter function.  I then use colwise() to get the mean of each column of this smaller more specific data frame so I 
can later construct a data frame of the means of the measures of each subject's different activities.  I use colwise() here because it returned a data frame instead of a list, and so I  could more easily construct my final data frame using rbind() once I fixed any values
converted to NAs. 

Section 15 I update the column names of my data frame of means of means and standard deviations so that it would be more clear
to another observer what I had done with the original data.  
