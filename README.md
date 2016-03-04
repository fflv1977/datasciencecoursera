Script Name: run_analysis.R

Decription:
sTAGE 1:
Brings all labels from files.

Stage 2:
Joins the TRAIN dataset and related label into one table (traindata1)

Stage 3:
Joins the TEST dataset and related label into one table (testdata1)

Stage 4:
Joins testdata1 + traindata1. (SOURCETABLE)

Stage 5:
Averages all variables by ACTIVITYNAME. (AVGTABLE)

Stage 6:
Writes a txt file with the average result.