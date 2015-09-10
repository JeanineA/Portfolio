######## Logistic Regression: Predicting World Series Champion ###########
# Predict World Series Chammpion using regular season performance.

# Data prep: Import data, limit dataset to teams in previous playoffs, 
# add variable for number of teams in playoffs each year
# add prediction factor to id winners of World Series
baseball=read.csv("baseball.csv")
baseball=subset(baseball,Playoffs==1)
baseball$NumCompetitors = PlayoffTable[as.character(baseball$Year)]
baseball$WorldSeries = as.numeric(baseball$RankPlayoffs == 1)

#Using logistical regression evaluate each variable independently for significance
summary(glm(WorldSeries~RankSeason, data=baseball, family="binomial"))
#etc for each variable

# Build log reg model using variables significant when independently evaluated
LogModel=(glm(WorldSeries~RankSeason+NumCompetitors+RA+Year, data=baseball, family="binomial"))

#Check correlations
cor(baseball[c("RankSeason","NumCompetitors","RA","Year")])

#Compare AIC value for model options to determine preferred model (lowest AIC)
summary(glm(WorldSeries~RA+NumCompetitors, data=baseball, family="binomial"))
summary(glm(WorldSeries~RA+RankSeason, data=baseball, family="binomial"))
# Etc



