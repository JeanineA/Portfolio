#### Text Processing: Spam ID and Predictions #####
# This example uses emails from the Enron legal case

# Load email data
email=read.csv("emails.csv",stringsAsFactors=FALSE)

# Create tidy corpus of words, word frequency counts(dtm),
# remove sparse terms, make results a dataframe with valid names,
# and add spam variable to new dataframe
library(tm)
corpus=Corpus(VectorSource(email$text))
corpus = tm_map(corpus, tolower)
corpus = tm_map(corpus, PlainTextDocument)
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, stopwords("english"))
corpus = tm_map(corpus, stemDocument)
dtm=DocumentTermMatrix(corpus)
spdtm = removeSparseTerms(dtm, 0.95)
emailSparse=as.data.frame(as.matrix(spdtm))
colnames(emailSparse) = make.names(colnames(emailSparse))
emailSparse$spam=email$spam
emailSparse$spam=as.factor(emailSparse$spam)

# Split data into training and test data sets
library(caTools)
set.seed(123)
split = sample.split(emailSparse$spam, 0.7)
train = subset(emailSparse, split == TRUE)
test = subset(emailSparse, split == FALSE)

# Create log, CART and random forest models
library(rpart,rpart.plot,randomForest)
spamLogMod=glm(spam~.,data=train, family=binomial)
spamTreeMod=rpart(spam~.,data=train,method="class")
set.seed(123)
spamRFMod=randomForest(spam~.,data=train)

#Make predictions on train set
TrainLogPred=predict(spamLogMod,data=train,type="response")
TrainTreePred=predict(spamTreeMod,data=train)
TrainRFPred=predict(spamRFMod,data=train,type="prob")

#Evaluate each prediction's accuracy and AUC on train set
library(ROCR)
#Log
table(train$spam, TrainLogPred >= 0.5)  # acc: 0.9990025
RPredLog=prediction(TrainLogPred,train$spam)
as.numeric(performance(RPredLog,"auc")@y.values) #auc: 0.9999959
#CART / Tree
TrainTreePredCol2 = TrainTreePred[, 2]
table(train$spam, TrainTreePredCol2 >= 0.5) # acc: 0.942394
RPredTree=prediction(TrainTreePredCol2,train$spam)
as.numeric(performance(RPredTree,"auc")@y.values) # auc: 0.9696044
#Random Forest
TrainRFPredCol2 = TrainRFPred[, 2]
table(train$spam, TrainRFPredCol2 >= 0.5)  # acc: 0.9793017
RPredRF=prediction(TrainRFPredCol2,train$spam)
as.numeric(performance(RPredRF,"auc")@y.values) # auc: 0.9979116

#Make predictions on test set
TestLogPred=predict(spamLogMod,newdata=test,type="response")
TestTreePred=predict(spamTreeMod,newdata=test)
TestRFPred=predict(spamRFMod,newdata=test,type="prob")

#Evaluate each prediction's accuracy and AUC on test set

#Log
table(test$spam, TestLogPred >= 0.5)  # acc: 0.9505239
RPredLog=prediction(TestLogPred,test$spam)
as.numeric(performance(RPredLog,"auc")@y.values) #auc: 0.9627517
#CART / Tree
TestTreePredCol2 = TestTreePred[, 2]
table(test$spam, TestTreePredCol2 >= 0.5) # acc: 0.9161816
RPredTree=prediction(TestTreePredCol2,test$spam)
as.numeric(performance(RPredTree,"auc")@y.values) # auc: 0.963176
#Random Forest
TestRFPredCol2 = TestRFPred[, 2]
table(test$spam, TestRFPredCol2 >= 0.5)  # acc: 0.975553
RPredRF=prediction(TestRFPredCol2,test$spam)
as.numeric(performance(RPredRF,"auc")@y.values) # auc: 0.9975656

#Feature Engineering: Add Word Count
wordCount = rowSums(as.matrix(dtm))
hist(WordCount)
hist(log(WordCount))
emailSparse$WordCount=log(Word Count)
boxplot(emailSparse$WordCount~emailSparse$spam)

# Make second train and test data with Word Count
train2 = subset(emailSparse, split == TRUE)
test2 = subset(emailSparse, split == FALSE)

#Build new CART and RF Models and run predictions
spamTreeMod2=rpart(spam~.,data=train2,method="class")
prp(spamTreeMod2)
spamRFMod2=randomForest(spam~.,data=train2)
TestTreePred2=predict(spamTreeMod2,newdata=test2)
TestRFPred2=predict(spamRFMod2,newdata=test2,type="prob")

#Evaluate each prediction's accuracy and AUC on test set

#CART / Tree
TestTreePred2Col2 = TestTreePred2[, 2]
table(test2$spam, TestTreePred2Col2 >= 0.5) # acc: 0.9301513
RPredTree2=prediction(TestTreePred2Col2,test2$spam)
as.numeric(performance(RPredTree2,"auc")@y.values) # auc: 0.9582438
#Random Forest
TestRFPred2Col2 = TestRFPred2[, 2]
table(test2$spam, TestRFPred2Col2 >= 0.5)  # acc: 0.9784633
RPredRF2=prediction(TestRFPred2Col2,test2$spam)
as.numeric(performance(RPredRF2,"auc")@y.values) # auc: 0.998071

