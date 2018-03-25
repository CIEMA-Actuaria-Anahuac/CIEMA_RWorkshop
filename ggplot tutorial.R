## GGPLOT 2
## Packages ----
install.packages("ggplot2")
library(ggplot2)

#Datasets----
data()
data(iris)
head(iris)
summary(iris)


# Plot ----
plot(iris)
plot(iris$Petal.Length,iris$Sepal.Width)

# ggplot ----
#aes static mapping, a relation ,variables
#base plot, add another plot

ggplot(iris,aes(x=Petal.Length,y = Sepal.Width)) +
  geom_point()


ggplot(iris,aes(x=Petal.Length,y = Sepal.Width, col=Species)) +
  geom_point()

ggplot(iris,aes(x=Petal.Length,y = Sepal.Width, col=Species,size=Petal.Width)) +
  geom_point()

ggplot(iris,aes(x=Petal.Length,y = Sepal.Width, col=Species,
                size=Petal.Width,shape=Species)) +
  geom_point()

ggplot(iris,aes(x=Petal.Length,y = Sepal.Width, col=Species,
                size=Petal.Width,shape=Species, alpha=Sepal.Length)) +
  geom_point()

# BAR and BoxPlot ----
ggplot(iris,aes(Species, Sepal.Length))+
  geom_bar(stat = "summary",fun.y="mean")

ggplot(iris,aes(Species, Sepal.Length, fill=Species))+
  geom_bar(stat = "summary",fun.y="mean")

ggplot(iris,aes(Species, Sepal.Length))+
  geom_bar(stat = "summary",fun.y="mean", fill="blue", col="black")

ggplot(iris,aes(Species, Sepal.Length))+
  geom_bar(stat = "summary",fun.y="mean", fill="blue", col="black")+
  geom_point()

ggplot(iris,aes(Species, Sepal.Length))+
  geom_bar(stat = "summary",fun.y="mean", fill="blue", col="black")+
  geom_point(position=position_jitter(0.2),size=3, shape=21)
