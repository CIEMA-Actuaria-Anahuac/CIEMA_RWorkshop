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

myPlot<-ggplot(iris,aes(Species, Sepal.Length))+
  geom_bar(stat = "summary",fun.y="mean", fill="blue", col="black")+
  geom_point(position=position_jitter(0.2),size=3, shape=21)


myPlot + theme(panel.grid = element_blank(),
               panel.background = element_rect(fill="white"),
               axis.line.y = element_line(color="black",size = 0.2),
               axis.line.x = element_line(color="black",size = 0.2))

myPlot + theme(panel.grid = element_blank(),
               panel.background = element_rect(fill="white"),
               panel.border = element_rect(color = "black",fill = NA,size = 0.2))

myPlot+theme_bw()
myPlot+theme_classic()
myPlot+theme_dark()
myPlot+theme_gray()
myPlot+theme_light()
myPlot+theme_linedraw()
myPlot+theme_minimal()
myPlot+theme_vold()


?theme

ggplot(iris,aes(Species, Sepal.Length))+
  geom_boxplot(fill="red",col="black",notch = T)+
  geom_point()

# finishing touches ----
myPlot+
  labs(x="",y="Sepal Length") +
  ggtitle("Sepal Length by Iris")+
  theme(plot.title = element_text(hjust = 0.5))

#saving our plot ----
ggsave("graph1.pdf",width = 8,height = 5)

# Factorial ----
data(ToothGrowth)
summary(ToothGrowth)

ggplot(ToothGrowth,aes(supp,len,fill=as.factor(dose)))+
  geom_bar(stat = "summary",fun.y="median",col="black",
           position = "dodge")+
  geom_point(position = position_dodge(0.9))

ggplot(ToothGrowth,aes(as.factor(dose),len,group=supp, color=supp))+
  geom_line(stat = "summary",fun.y="mean")+
  geom_smooth(method = "lm")
