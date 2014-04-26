README
===========================================================

author: Kourosh Razban

Script name: run_analysis.R 
 

This script was created an ran under R version 3.0.2 (2013-09-25)
on a Windows machine. 

Only the base packages in R required to run this script. 

**Data input requirement** : Following zip file should exist in _data_ directory under current working directory or, presence of internet connection that the file could be downloaded by the script automatically. **Note:** zip file must not be decompressed. 


```
getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

```
This script will check for the existance of the _data_ directory under working directory and in the case of non-existance it will create one.

The resultuing tidy dataset will be written in the _data_ directory under the name of 
__samsungtidyds.txt__ .

Notes
--------
All column names are transformed to lower case.

Each row is a vector of mean and standard diviation averages.

parenthesis and underscores are removed.

Each part of the feature names is separated by a dot.




## Procedure

This script will read the zip file and does not need  to unzip the file. As it was instructed in the assignment, 

* starts preparing a complete dataset by reading the "activity-labels.txt" and features.txt.

* read the tables of test, and train data sets and creates two separte datasets named _test.ds_ and _train.ds_ .

* Combine the two newly created datasets.

* Select only the columns with mean and std from features.

* Extract the selected columns in the prevous step from the combined dataset.

* Sort the selected dataset based on the subject and activity.

* Aggregate the feature columns for each subject actvity.

* Tidy up the column names and variables.

* Write the resulting dataset in the data directory.