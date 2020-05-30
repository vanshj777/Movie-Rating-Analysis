#Movie rating Analytics using GGPLOT2

#We need to create a Boxplot using the data showing the frequency distribution between the 
#gross % in America according to the Genre of the movie. In the Legend section the size of
#bullets will show the budget of the movies and colour will show the various production
#houses/studios in which the movies are produced.
#Boxplot must be prepared using 5 genres only action, adventure, animation,comedy, drama
# and specific studios such as buena vista studios, fox, paramount pictures, sony,
# universal, WB.
#-------------------------------------------------------------------------------------------

movies <-read.csv(choose.files())

#data exploration
head(movies, 5)
tail(movies, 5)

summary(movies)

str(movies)

#activating ggplot2

library(ggplot2)

#our data is in character datatype, so for a better visualisation we should convert them in to factors!
movies$Day.of.Week <- as.factor(movies$Day.of.Week)
movies$Genre <- as.factor(movies$Genre)
movies$Studio <- as.factor(movies$Studio)

#since we have a huge data and we need only 6 genre  we will now filter the data.

f1 <- (movies$Genre == "action") | (movies$Genre =="adventure") | (movies$Genre =="comedy") | (movies$Genre=="animation") | (movies$Genre=="drama")

#filtering the studios

f2 <-(movies$Studio == "Buena Vista Studios") | (movies$Studio == "Fox") | (movies$Studio == "Sony") | (movies$Studio == "Paramount Pictures") | (movies$Studio == "WB") | (movies$Studio == "Universal")

#lets combine the two filter.

movies_final <- movies[f1 & f2,]

#the data for our requirement has been prepared now its time to visualise them and create 
# the boxplot.

p <- ggplot(data = movies_final, aes(x= Genre, y = Gross...US))
q <- p + geom_jitter(aes(size = Budget...mill., colour = Studio)) + geom_boxplot(alpha=0.7, outlier.colour = NA) 

q

#lets give our plot the final touch, (non data ink)

q + 
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre")

#---------------------------------------------------------------------------------------------------------------------
