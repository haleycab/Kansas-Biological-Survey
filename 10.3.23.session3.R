#Lesson 4: More on Vectors
function c() builds a vector
sum(Nile > 1200) shows how many years the river level exceeded 1200
Nile > 1200
which(Nile>1200) which elements?
length(which(Nile>1200)) : same as sum
Nile[which(Nile>1200)] what were the river flows in those 7 years?
or just use Nile[Nile>1200]
#negative indices
x <- c(5,12,13,8)
x[-1]  
#Lesson 5: Data Frames
?ToothGrowth
head(ToothGrowth)
tg<-ToothGrowth
tg[3,1] third row first column entry
mean(tg$len)
can use tg$len as a vector
find the number of rows in a data frame nrow(tg)
or length(tg$len)
head(tg$len,10)
#create own data frames
x <- c(5,12,13)
> y <- c('abc','de','z')
> d <- data.frame(x,y)
tg$dose[tg$len[tg$len<10]]
?faithful
mean(faithful$waiting)
faithful$waiting<50
max(faithful$eruptions)
#Lesson 6: R factor class
numeric
character
data.frame
#categorical variables
levels(tg$supp) : find a list of categories
#Lesson 7: Extracting
whichOJ<-which(tg$supp=='OJ')
mean(tg[whichOJ,1]) remember d[rows,columns]
tgoj <- tg[tg$supp == 'OJ',]
mean(tgoj$dose)
#Lesson 8: More examples of extracting
tg[tg$supp=='OJ' & tg$len < 8.8,]
tg[tg$len > 28 | tg$dose == 1.0,]
w <- tg[tg$len > 28 | tg$dose == 1.0,]
w becomes a new data.frame
lendose <- tg[,c(1,3)]
lendose <- tg[,c('len','dose')]
exts <- Nile[Nile < 800 | Nile > 1300]
#Lesson 11: The R list class
head(mtcars)
mtmpg<-mtcars$mpg
#split vector
mt4<-mtmpg[mtcars$cyl==4]
mt6<-mtmpg[mtcars$cyl==6]
mt8<-mtmpg[mtcars$cyl==8]
#cleaner way
mtl <- split(mtmpg,mtcars$cyl)
class(mtl) : split into three separate lists
mtl$'4' same as mtl[[1]]
mtl[[2]][3] : the MPG for the third car in the 6-cylinder category
mtl[[2]] is a vector and [3] declares the element
split(tg$len,tg$supp)->tgsupp
tgsupp[[1]]->tgOGlen
tgsupp[1]











