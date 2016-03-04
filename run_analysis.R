##########################################################
######Assignment: Getting and Cleaning Data Course Project
##########################################################

##########################
### TABLE1: TIDY DATASET
##########################


######1
## LABEL PREPARATION
##Brings labels
lbfeatures<- read.table("./features.txt")
colnames(lbfeatures)[1] <- "FEATUREID"

lbactivity<- read.table("./activity_labels.txt")
colnames(lbactivity)[1] <- "ACTIVITYID"
colnames(lbactivity)[2] <- "ACTIVITYNAME"

######2
#TRAIN DATASET PREPARATION
#All relevant tables/labels are put together:

##Brings Training Data with labels (feature names)
traindata <- read.table("./train/X_train.txt", col.names = lbfeatures[,2])

##Brings Subject column. Label added (SUBJECTID)
colsubject <- read.table("./train/subject_train.txt", col.names = "SUBJECTID")

##Brings Activity column. Label added (ACTIVITYID)
colactivity <- read.table("./train/y_train.txt", col.names = "ACTIVITYID")

##Adds labels to Activities
colactivity <- merge(colactivity, lbactivity, by = "ACTIVITYID")


##Combines "DATASET"+Subject+Activity+Data
traindata1<-cbind("TRAIN", colsubject, colactivity, traindata)
##Renames first column (DATASET)
colnames(traindata1)[1] <- "DATASET"


######3
#TEST DATASET PREPARATION

##Brings Training Data with labels (feature names)
testdata <- read.table("./test/X_test.txt", col.names = lbfeatures[,2])

##Brings Subject column. Label added (SUBJECTID)
colsubject <- read.table("./test/subject_test.txt", col.names = "SUBJECTID")

##Brings Activity column. Label added (ACTIVITYID)
colactivity <- read.table("./test/y_test.txt", col.names = "ACTIVITYID")
##Adds labels to Activities
colactivity <- merge(colactivity, lbactivity, by = "ACTIVITYID")


##Combines "DATASET"+Subject+Activity+Data
testdata1<-cbind("TEST", colsubject, colactivity, testdata)
##Renames first column (DATASET)
colnames(testdata1)[1] <- "DATASET"


######4
#DATASET PREPARATION
#Combines TRAIN + TEST datasets in one single table.
SOURCETABLE<-rbind(testdata1,traindata1)

#Restrict columns to main variables + mean + std
SOURCETABLE<-SOURCETABLE[ , grepl( "DATASET|SUBJECTID|ACTIVITYNAME|mean()|std()" , names( SOURCETABLE ) ) ]




##########################
### TABLE2: AVERAGE DATASET
##########################

#Restrict columns to ACTIVITY + MEAN + STD
AVGTABLE<-subset(SOURCETABLE, select=-c(DATASET,SUBJECTID))

#AVERAGE ALL VARIABLES
AVGTABLE<-aggregate(. ~ ACTIVITYNAME,data = AVGTABLE,FUN=mean)

#WRITE TABLE
write.table(AVGTABLE, "./AVERAGETABLE.txt", sep=" ", row.names=FALSE)