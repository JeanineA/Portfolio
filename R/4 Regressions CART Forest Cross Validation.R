######## Trees: Predicting Housing Prices in Boston ###########
# The source data is a  1978 dataset containing information collected by the U.S Census Service 
# concerning housing in the area of Boston MA and was used to study pollution levels
# and impact on housing prices. https://archive.ics.uci.edu/ml/datasets/Housing
# The Example compares linear, CART, CART with cross validation, and Random Forest methods. 

# Read dataset and plot the lon and lat of census tracts.
boston=read.csv("boston.csv")
plot(boston$LON,boston$LAT)

# Data exploration: Color tracts adjacent to St Charles River in blue, and nitrous oxide levels
# greater than the mean. 
points(boston$LON[boston$CHAS==1],boston$LAT[boston$CHAS==1],col="blue",pch=19)
summary(boston$NOX)
points(boston$LON[boston$NOX>0.55],boston$LAT[boston$NOX>0.55],col="green", pch=19)
# Data Exploration: Create new plot showing tracts with housing values greater than the median. 
summary(boston$MEDV)
plot(boston$LON,boston$LAT) 
points(boston$LON[boston$MEDV>21.2],boston$LAT[boston$MEDV>21.2],col="blue",pch=19)

# Create regression tree using LAT and LON to predict housing values. 
library(rpart,rpart.plus)
LatLonM=rpart(MEDV~LAT+LON,data=boston)
prp(LatLonM)
LatLonP=predict(LatLonM)

#Visualize tree prediction against actual results. Red is home value > median, 
# dollar signs are predictions.
plot(boston$LON, boston$LAT)
points(boston$LON[boston$MEDV>=21.2], boston$LAT[boston$MEDV>=21.2], col="red", pch=20)
points(boston$LON[LatLonP>21.2], boston$LAT[LatLonP>21.2], col="blue", pch="$")

#Simplify the tree by setting a minbucket size and view plot of branches.
LatLonMin=rpart(MEDV~LAT+LON,data=boston,minbucket=50)
plot(LatLonMin)
text(LatLonMin)

# Plot graphically and add straight lines to show splits leading to section with lowest home values. 
plot(boston$LON, boston$LAT)
abline(v=-71.07,col="blue",lty=3)
abline(h=42.21,col="blue",lty=3)
abline(h=42.17,col="blue",lty=3)
# Validate if tree prediction generally aligns wih actual data. 
points(boston$LON[boston$MEDV>=21.2], boston$LAT[boston$MEDV>=21.2], col="red", pch=20)

# Split data into training and test, then run predictions. 
library(caTools)
set.seed(123)
split = sample.split(boston$MEDV, SplitRatio = 0.7)
train = subset(boston, split==TRUE)
test = subset(boston, split==FALSE)

# Basic linear model, prediction, and result
linMod = lm(MEDV ~ LAT + LON + CRIM + ZN + INDUS + CHAS + NOX + RM + AGE + DIS + RAD + TAX + PTRATIO, data=train)
summary(linMod)
PredlinMod=predict(linMod,newdata=test)
sum((PredlinMod-test$MEDV)^2)
# results: R Squared is 65, SSE is 3037

# Evaluate tree regression results against linear regression 
TreeMod = rpart(MEDV ~ LAT + LON + CRIM + ZN + INDUS + CHAS + NOX + RM + AGE + DIS + RAD + TAX + PTRATIO, data=train)
prp(TreeMod))
TreePred=predict(TreeMod,newdata=test)
sum((TreePred-test$MEDV)^2)
# results: SSE is 4328.988

# Use K-fold cross validation to  find cp value that improves tree model
library(caret,e1071)
trControl=trainControl(method = "cv", number = 10) # 10-fold cross validation
cpgrid=expand.grid( .cp = (0:10)*0.001) #range of cp values to try
tr=train(MEDV ~ LAT + LON + CRIM + ZN + INDUS + CHAS + NOX + RM + AGE + DIS + RAD + TAX + PTRATIO, data = train, method = "rpart", trControl = trControl, tuneGrid = cpgrid)

#Create new CART model and make predictions
bestTree=tr$finalModel
prp(bestTree)
bestTreePred=predict(bestTree,newdata=test)
sum((bestTreePred-test$MEDV)^2)
# results: SSE is 3660.149

# Create Random Forest model and evaluate results
library(randomForest)
forestMOD = randomForest(MEDV ~ LAT + LON + CRIM + ZN + INDUS + CHAS + NOX + RM + AGE + DIS + RAD + TAX + PTRATIO, data=train, ntree=200)
forestPred=predict(forestMOD,newdata=test)
sum((bestTreePred-test$MEDV)^2)
#result: SSE is 1618.783

















