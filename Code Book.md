## a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called  
## CodeBook.md.

featuresDF ->  data frame containing all of the column labels for the training and testing data sets.  

activityLabelsDF -> data frame containing the six different labels for activities levels found in the yTrain and yTest 
data frames. 

subjectTrainDF -> data frame containing a column of observational data correlating to which subject each row of
xTrainDF and yTrainDF was relevant to. Column containing subject data was renamed for readability. 

xTrainDF <- data frame containing the measurements correlating with the variables cited in featuresDF.  Columns
containg measurements were renamed to be better accessible and correlated with what they represented.

yTrainDF <- data frame containing the activity levels for each observation/row - represented as numbers 1-6.  Column
in dataframe was renamed "Activity" for readability.

a -> a vector containing the feature labels from featuresDF.

counter-> an integer variable used to increment and guide the scripts for loop.

myTrainDF -> data frame that is the combination of xTRainDF, YTrainDF, and subjectTrainDF.

subjectTestDF ->  same as subjectTrainDF only a data frame for train data.

xTestDF -> same as xTrainDF only a data frame for train data.

yTestDF -> same as yTrainDF only data frame for train data.

a -> again; vector containing the feature labels from featuresDF.

counter-> again; an integer variable used to increment and guide the scripts for loop to rename columns in xTestDF.

myTestDF -> same as myTrainDF only for test data.

myFinalDF -> data frame that is combination of all train and test data from the origanl data set.

activityLabelVector -> vector containing the six different activity labels from activityLabelsDF

counter-> again; an integer variable used to increment and guide the scripts for loop.

myFinalDF -> numbers contained in myFinalDF$Activity were changed to factors to better represent the 
activities they referred to with for loop starting on 73.  

stdcols -> on line 81 "a" contains a list consisting of all columns myFinalDF that contain standard deviation measurements
of measurements.

meancols -> on line 81 "b" contains a list consisting of all columns myFinalDF that contain mean measurements
of measurements.

myTrueDF -> Data frame consisting of data frame columns from myTrueDF cited in stdcols and meancols, as well as the acitvity and 
subject columns from myFinalDF.

-> using paste and sub the names of the columns of myTrueDF were expanded and altered so that they would be more human 
readable.  This was accomplished by deciphering what each section of the original column names refered to using the
data set's README files.

myTrueDF -> was then rearranged by subject number using arrange

k -> a list containing the different activity labels.  Will be used as iteration variable in for loop.

counter -> again; an integer variable used to increment and guide the scripts for loop.

i&h -> iteration variables intialize din the for loop.

DFQ5 -> a data frame intialized with filter with arguments myTrueDF and a non existent activity observation so that it
would be an empty data frame with the correct dimensions and column names.

temp -> a data frame in the for loop that at each iteration represents a portion of myTrueDF

z -> the resulting data frame after colwise is calls mean to be applied on each column of temp 

z$Activity -> called so the NA produced in the Activiy column by colwise can be changed back to teh appropriate 
factor calling on the contents of i.

DFQ5 (Data Frame Question 5) -> has each resulting data frame z from the for loop at line 108 bound to it until it contains 
the means of the measurements of the means and standrad deviations of the original data set measurements for each 
subject at each activity level.  

-> paste and sub were once again called to alter the column names of DFQ5 so it they would beeter represent the data 
they contained. 
