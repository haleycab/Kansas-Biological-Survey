Lesson 12: Another Look at the Nile Data
plot date again time : plot(Nile)
#find low value 
which(Nile<600)
#two argument plot
plot(mtcars$wt,mtcars$mpg)
single vector = contnuos
two vectors = scatter plot
class(Nile) ; time series or ts
Want to know flow in the year 1925, data starts in 1871 Nile[1 + 1925 - 1871]
#do things by hand as little as possible
Lesson 14: Intro to Base R Graphics
> load(url('https://github.com/matloff/fasteR/blob/master/data/prgeng.RData?raw=true'))
head(prgeng)
use load()to input the data
plot(prgeng$age,prgeng$wageinc)
#so much data, use sample
indxs <- sample(1:nrow(prgeng),2500)
prgeng2500 <- prgeng[indxs,]
more compact: prgeng2500 <- prgeng[sample(1:nrow(prgeng),2500),]
#but breaking it into smaller sections is easier to follow
plot(prgeng2500$age,prgeng2500$wageinc)
#color code by gender
plot(prgeng2500$age,prgeng2500$wageinc,col=prgeng2500$sex)
# add labels and make dots smaller
plot(prgeng2500$age,prgeng2500$wageinc,col=c(nocollege,somecollege,bachelorsdegree,masters,professional,doctorate),xlab='age',ylab='wage',cex=0.6)
#your turn
plot(prgeng2500$age,prgeng2500$wageinc,col=(3+as.numeric(prgeng2500$educ)>9))
nocollege=as.numeric(prgeng2500$educ)<=9
somecollege=as.numeric(prgeng2500$educ)>=10&as.numeric(prgeng2500$educ)<=12
bachelorsdegree=as.numeric(prgeng2500$educ)==13
masters=as.numeric(prgeng2500$educ)==14
professional=as.numeric(prgeng2500$educ)==15
doctorate=as.numeric(prgeng2500$educ)==16

typeof(prgeng2500$educ)
?double
as.numeric(prgeng2500$educ)
Lesson 15:
wageByGender <- split(prgeng$wageinc,prgeng$sex)
dm <- density(wageByGender[[1]]) : men
dw <- density(wageByGender[[2]]) : women
#womens smooth line and mens black paints
plot(dw,col='red')
points(dm,cex=0.2)
Lesson 16: Writing Your Own Functions
1 find:  gt1200Indices <- which(Nile > 1200) 
2 extract: nileSubsetGT1200 <- Nile[gt1200Indices]
3 compute: mean(nileSubsetGT1200)
#can create a function that does these steps 
mgd <- function(x,d) mean(x[x > d])
mgd(Nile,1200)
mgd(tg$len,10.2)
funtion() job is to build a function()
#save a function in a file
save(mgd,file='mean_greater_than_d')
mgd
Activity 2
install.packages(“mgcv”)
library(mgcv) #load package
plot(prgeng2500$age,prgeng2500$wageinc)
smoothModel=gam(prgeng2500$wageinc ~ s(prgeng2500$age))
points(prgeng2500$age, smoothModel$fitted.values, col=2)
Activity 3
#Install ggplot2 package. This is very popular for making plots. 
#But we need it because it comes with some fun example data.
install.packages("ggplot2")
library(ggplot2)
#Load datasets to plot. After running, you will have objects 
#called "msleep" and "EuStockMarkets" in your environment that you can work with.
data(msleep)
data(EuStockMarkets)
#Create a vector of dates when stock market recorded
stockTime=as.numeric(time(EuStockMarkets))
#For plotting: set graphing panel layout to be 2 plots y 2 plots. 
#See preceding exercises for explanation.
par(mfrow=c(2,2))
#For the first graph, you will need to use the function matplot. Google or enter ?matplot in R console
head(msleep)
?matplot
#first graph
matplot(x=stockTime, y=EuStockMarkets, cex=0.3,xlab="stockTime",ylab="EuStockMarkets")
?plot
#second graph
plot(msleep)
head(msleep,30)
plot(msleep$brainwt,msleep$sleep_total,col=3,pch=18,xlab="Brain weight, kg",ylab="Total sleep, hrs" )
#third graph
plot(log(msleep$bodywt),log(msleep$brainwt),col=4,pch=18,xlab="Brain weight, kg",ylab="Body weight, kg" )
plot(x=msleep$bodywt,y=msleep$brainwt,col=4,pch=18,xlab="Brain weight, kg",ylab="Body weight, kg",main="body vs brain weights\n across species",ymax=100)
legend("topleft","one mammal species",col=4,pch=18,cex=.75)
title("body vs brain weights across species", cex=.5)
  ?log
#fourth graph
par(new=TRUE)
plot(log(msleep$brainwt),msleep$sleep_total, pch=18, col=c(5,2),xlab="log Brain weight,kg",ylab="Total sleep, hrs")
#axis(4,lwd.ticks=msleep$brainwt)
legend("topright",c("Total sleep","REM sleep"),pch=16,col=c(5,2),cex=.6)
?axis()
