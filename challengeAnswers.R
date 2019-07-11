### Challenge answers

rm(list=ls())

# Read in the data
lakesDF = read.csv("data/lakeData.csv", stringsAsFactors = F) #read in data


# 1.
highTP=lakesDF[lakesDF$TP>20,]
lowTP=lakesDF[lakesDF$TP<20,]

# 2.
# Subset only Michiana lakes
michiana=lakesDF[lakesDF$location=="Michiana",]
# Plot DOC versus TP
plot(michiana$DOC, michiana$TP, xlab="DOC", ylab="TP", main="Michiana Lakes")
# Generate linear model describing the relationship between the two variables
fitLM=lm(michiana$TP~michiana$DOC)
# Print the summary of the model
summary(fitLM)

# 3.
# Calculate mean pH of UNDERC lakes 
mean(lakesDF$pH[lakesDF$location=="UNDERC"])
# Calculate mean pH of Michiana lakes 
mean(lakesDF$pH[lakesDF$location=="Michiana"])
# Plot 
boxplot(lakesDF$pH~lakesDF$location)
# Conduct t-test
t.test(lakesDF$pH~lakesDF$location)
