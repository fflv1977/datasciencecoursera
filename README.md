#Script Name: run_analysis.R

#Source Files:
 ## Files belonged to the Human Activity Recognition Using Smartphones Dataset
(Version 1.0)
 ## Download Site: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


#Analysis Goal:
 ## To clean and prepare data for further analysis.


#Analysis Description:
	##Labels were added to all tables.
	##Data Tables were combined to produce one single dataset.
	##Extra variables were removed.
	##Dataset was aggregated by columns SUBJECTID and ACTIVITYID. Mean calculated for all variables.


#Results:
	##SOURCETABLE; This table contain all measurements for all datasets required for analysis.
	##AVERAGETABLE; This table is the result of aggregating the SOURCETABLE by ACTIVITY and SUBJECT.
