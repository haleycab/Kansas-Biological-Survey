#Friday September 29th Session 2
2.6 use source to run whole script, run for highlighted portions
#extract function. highlight script, hit code>Extract function.
#4 Project 2: Playing Cards
#5.1 Atomic Vectors: simple vector of data. is.vector tests whether an object is an atomic vector
is.vector(x3)
#one dimensional vector, and each atomic vector can only store one type (doubles, integers, characters, logicals, complex, and raw)
#doubles(also numerics):  store regular numbers
figure out what type using typeof(die)
#integers
can specifically create an integer in R by typing a number followed by -3L
#integers w/o L will be saved as doubles. Integers are defined more precisely in your computer’s memory than doubles (unless the integer is very large or small).
ex/ sqrt(2)^2 - 2 does not equal zero. -> floating point error
#characters
text <- c("Hello",  "World")
text
#individual letters of a character vector are known as strings
#anything surrounded in quotes is a character string
#logicals: store TRUE and FALSE. T and F are shorthand for these, unless defined elsewhere
#complex and raw: uncommon
#complex: store complex numbers.
#raw: store raw bytes of data
raw()
#5.2 Vecotr of Cards
hand <- c("ace", "king", "queen", "jack", "ten") : creates a one-dimensional group of card names
#attribute: a piece of info you can attach to an atomic vector or any R object. “metadata”; it is just a convenient place to put information associated with an object
see what attributes()
#common attributes: names, dimensions (dim), and classes
names(die) <- c("one", "two", "three", "four", "five", "six")
die : named the elements of the object
die + 1 : names won’t affect the actual values of the vector, nor will the names be affected when you manipulate the values of the vector
rename : names(die) <- c("uno", "dos", "tres", "quatro", "cinco", "seis")
remove name : names(die) <- NULL
#dim: transform an atomic vector into an n-dimensional array by giving it a dimensions attribute
R will reorganize the elements of the vector into n dimensions. 
(rows, columns) : dim(die) <- c(2, 3)
(row, column, slice) : dim(die) <- c(1, 2, 3)
#R fills up each matrix by columns. 
help: ?matrix ?array
#matrices
(atomic vector, nrow/ncol=, byrow= ) m <- matrix(die, nrow = 2, byrow=TRUE)
#5.4 arrays: creates an n-dimensional array, basically does the same thing as setting the dim attribute
royal flush
hand1 <- c("ace", "king", "queen", "jack", "ten", "spades", "spades", 
           "spades", "spades", "spades")
#class
dim(die) <- c(2, 3)
typeof(die)
##  "double"
class(die)
##  "matrix"
#Dates and Times : data type: double class: POSIXct POSIXt
now <- Sys.time()
class(df)
matrix(hand1, nrow = 5)
matrix(hand1, ncol = 2)
dim(hand1) <- c(5, 2)
shows how R is storing data: unclass(now)
unclass(1000000) <- c("POSIXct", "POSIXt")
#factors: can store catergorical data
gender <- factor(c("male", "female", "female", "male"))
attributes(df)
#used levels attribute when displaying a factor, 
#factors code categorical variables into numbers
converts one type into another type(character,logical, numeric) : as.character(gender)
#coercion: character string -> logicals -> numbers.  arrangement preserves information
sum(c(TRUE, TRUE, FALSE, FALSE))
#lists: store multiple types of objects
list1 <- list(100:130, "R", list(TRUE, FALSE))
card <- list("ace", "hearts", 1)
#you can save a deck of playing cards as a list of 52 sublists, but easier would be..
#data frames: 2D list, like an Excel spreadsheet
#each column of a data frame can contain a different type of data; but within a column, every cell must be the same type of data.Every column in a data frame must be the same length.
df <- data.frame(face = c("ace", "two", "six"),  
suit = c("clubs", "clubs", "clubs"), value = c(1, 2, 3))
df
#make sure that each vector is the same length (or can be made so with R’s recycling rules
can give names to list/vector : list(face = "ace", suit = "hearts", value = 1)
c(face = "ace", suit = "hearts", value = "one")
see what types of objects are grouped together by a list : str(df)
R saved character strings as factors, can prevent that with stringsAsFactors = FALSE
df <- data.frame(face = c("ace", "two", "six"),  
                 suit = c("clubs", "clubs", "clubs"), value = c(1, 2, 3),
                 stringsAsFactors = FALSE)
head and tail are two functions that provide an easy way to peek at large data sets
head(Deck,10)
save a copy: write.csv(Deck, file = "cards.csv", row.names = FALSE)
Deck -> deck
# 6 R Notation
extract a value of set of values from data frame [row, column]: deck[ , ] 
#write indexes 6 ways
#1 positive integers
deck[1,3]
To extract more than one value : deck[1, 1:3]
prefer a data frame instead, you can add the optional argument drop = FALSE
deck[1, 1:3,drop=FALSE]
#negative integer
R will return every element except the elements in a negative index. deck[-(2:52), 1:3]
You can use a blank space to tell R to extract every value in a dimension
#logical values
deck[3, c(TRUE,FALSE, TRUE)]
#names
deck[1, c("face", "suit", "value")]
deck[1,]
deal <- {deck[sample(1,replace = FALSE),]}
deck2 <- deck[1:52, ]
random <- sample(1:52, size = 52)
deck[random,]
deal <- function(cards) {
  cards[1, ]
}
shuffle <- function(cards) { 
  random <- sample(1:52, size = 52)
  cards[random, ]
}

shuffle <- function(cards) { 
  random <- sample(1:52, size = 52)
  cards[random, ]
deal <- function(cards){ cards[1,]}
deal(deck)
deck2<- deck[1:52,]
head(deck2)
random <- sample(1:52, size=52)
deck4<-deck[random,]
shuffle <- function(cards) { 
  random <- sample(1:52, size = 52)
  cards[random, ]
}
shuffle(deck)
deck2<-shuffle(deck)
deal(deck2)
#dollar signs to select values from data frame
deck$value
#will return all values as a vector, helpful to run functions
mean(deck$value)
#list() 
lst <- list(numbers = c(1, 2), logical = TRUE, strings = c("a", "b", "c"))
lst[2] : extract 1st list with one element w name
lst[[1]]: extract 1st list with one element wo name
significance: sum(lst[2]) sum(lst[[2]])
lst$numbers
list(deck$face)
#single brackets to select train cars, double brackets to select the contents inside of a car

Lesson 7: Modifying Values
d3ck<-deck
#modify value using <-
vec <- c(0, 0, 0, 0, 0, 0)
vec[1]<-1000
#can replace multiple values at once
vec[c(1, 3, 5)] <- c(1, 1, 1)
?c()
#add one to entrys 4-6
vec[4:6] <- vec[4:6] + 1
#add new column to dataframe:
d3ck$new<-1:52
head(d3ck)
#remove columns:
d3ck$new<-NULL
#war
d3ck[c(13, 26, 39, 52),3 ] and d3ck$value[c(13, 26, 39, 52), ] are the same
d3ck[c(13, 26, 39, 52),3 ] <-14
#use logical subsetting to extract aces
< > <= >= == != %in%
d3ck$face=="ace"
sum(d3ck$face=="ace")
d3ck$value[d3ck$face == "ace"] <- 14
deck4<-deck
deck4$value<-0
deck4$value[deck4$suit=="hearts"]<-1
deck4$value[deck4$face=="queen" &deck4$suit=="spades"]<-13
#Boolean Operators
& | xor() ! any() all()
#need to put complete tests one either side of the boolean operators
#When used with vectors, Boolean operators will follow the same element-wise execution as arithmetic and logical operators
#practice w tests
w <- c(-1, 0, 1)
x <- c(5, 15)
y <- "February"
z <- c("Monday", "Tuesday", "Friday")
#Is w positive?
w>0
#Is x greater than 10 and less than 20?
x>10&x<20
#Is object y the word February?
y=="February"
#Is every value in z a day of the week?
all(z %in% c("Monday","Tuesday","Wednesday","Friday"))
#blackjack
deck5<-deck
deck5$value[deck5$face=="king"|deck5$face=="queen"|deck5$face=="jack"]<-10
#or
facecard <- deck5$face %in% c("king", "queen", "jack")
deck5$value[facecard] <- 10
#missing information
called NA
#can't do simple calculations w all data is there is one NA value
na.rm() : use to ignore NA values in data set
is.na() : use to identify NA values bc logical tests w NA will just return NA
#can set values as NA
deck5$value[deck5$face == "ace"] <- NA




Lesson 16 Writing Your Own Functions

> mgd <- function(x,d) mean(x[x > d])

Lesson 17 fasteR 'For' Loops
