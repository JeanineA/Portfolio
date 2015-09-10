# This file includes two linear regression examples #
######## 1. Linear Regresssion: State Data Exploration ###########
# Run linear regression models using a state dataset. 

# Load the dataset and convert it to a data frame. 
data(state)
statedata = cbind(data.frame(state.x77), state.abb, state.area, state.center,  state.division, state.name, state.region)

#Plot all of the states' centers using latitude and longitude.
plot(statedata$x, statedata$y) 

#Which region of the US has the highest average high school graduation rate?
tapply(statedata$HS.Grad, statedata$state.region, mean)

#Make a boxplot of the murder rate by region
boxplot(statedata$Murder~statedata$state.region)

#build a model to predict life expectancy by state 
#using the state statistics in our dataset.
LifeExp=lm(Life.Exp~Population+Income+Illiteracy+Murder+HS.Grad+Frost+Area,data=statedata)

#Simplify the model be removing variables using P (large) and/or t values (small). 
LifeExp=lm(Life.Exp~Population+Murder+HS.Grad+Frost,data=statedata)

# Make predictions with the training data then review residuals to evaluate fit of model to train set. 
sort(predict(LifeExp))
sort(abs(statedata$Life.Exp - predict(LifeExp)))

######## 2. Linear Regresssion: Sales Forecasts ###########
# Predict monthly sales of the Hyundai Elantra in the United States using 
# economic indicators of the United States and Google search queries.

# Load the data set and create a factor variable for month. Split the data set into training and testing sets as follows: 
# place all observations for 2012 and earlier in the training set, 
# and all observations for 2013 and 2014 into the testing set.
cardata=read.csv("elantra.csv")
cardata$MonthFactor=as.factor(cardata$Month)
cartrain=subset(cardata, Year<2013)
cartest=subset(cardata, Year>2012)

#Create linear model using month as a factor variable
carmodel=lm(ElantraSales~MonthFactor+Unemployment+CPI_all+CPI_energy+Queries,data=cartrain)

#Review variables for high corellations
cor(cartrain[c("Unemployment","Month","Queries","CPI_energy","CPI_all")])

#Revise and improve model based on p and t values.
carmodel=lm(ElantraSales~MonthFactor+Unemployment+CPI_all+CPI_energy,data=cartrain)

#Make Predictions and evaluate results
carsalesP=predict(carmodel,newdata=cartest)
SSE=sum((carsalesP-cartest$ElantraSales)^2)
baseline=mean(cartrain$ElantraSales)
SST=sum((baseline-cartest$ElantraSales)^2)
RSquared=1-SSE/SST



