> #incomplete command is signaled by +
  > 5-
  + 4
[1] 1
> #can do anyhting in R you can do with a calculator
  > #cancel command by pressing ctrl + c
  > 15+2
[1] 17
> 17*3
[1] 51
> 51-6
[1] 45
> 45/3
[1] 15
> #an R object if u name data
  > die<-1:6
  > #environment pane displays objects
    > #names cant start with a number or use some symbols
    > #again, R is case sensitive
    > #when renaming will replace old named object
    > ls()
  [1] "die"
  > #function will display object names
    > die-1
  [1] 0 1 2 3 4 5
  > die/2
  [1] 0.5 1.0 1.5 2.0 2.5 3.0
  > die*die
  [1]  1  4  9 16 25 36
  > #R uses element-wise execustion, if you give R vectors of unequal lengths it will repeat shorter vector until it is as long as the longer vector 
    > die+1:2
  [1] 2 4 4 6 6 8
  > die+1:4
  [1] 2 4 6 8 6 8
  Warning message:
    In die + 1:4 :
    longer object length is not a multiple of shorter object length
  > #if longervector/shortervector is not an integer, R will display warning message
    > #inner multiplication w/ command %*%
    > die %*% die
  [,1]
  [1,]   91
  > ?%*%
    Error: unexpected SPECIAL in "?%*%"
  > die*die
  [1]  1  4  9 16 25 36
  > sum(die*die)
  [1] 91
  > #outer multiplication w/%o%
    > die %o% die
  [,1] [,2] [,3] [,4] [,5] [,6]
  [1,]    1    2    3    4    5    6
  [2,]    2    4    6    8   10   12
  [3,]    3    6    9   12   15   18
  [4,]    4    8   12   16   20   24
  [5,]    5   10   15   20   25   30
  [6,]    6   12   18   24   30   36
  > #transpose matrix w/ t and find determinant w/ det
    > det die
  Error: unexpected symbol in "det die"
  > det(die)
  Error in UseMethod("determinant") : 
    no applicable method for 'determinant' applied to an object of class "c('integer', 'numeric')"
  > det(die %o% die)
  [1] 0
  > t(die %o% die)
  [,1] [,2] [,3] [,4] [,5] [,6]
  [1,]    1    2    3    4    5    6
  [2,]    2    4    6    8   10   12
  [3,]    3    6    9   12   15   18
  [4,]    4    8   12   16   20   24
  [5,]    5   10   15   20   25   30
  [6,]    6   12   18   24   30   36
  > round(3.5)
  [1] 4
  > factorial(52)
  [1] 8.065818e+67
  > #random selection with sample function
    > sample(x=die,size=1)
  [1] 2
  > sample(x=die,size=1)
  [1] 6
  > #separate arguments with commas
    > sample(die)
  [1] 6 2 1 5 3 4
  > sample(x=die)
  [1] 2 6 5 3 1 4
  > ?corners
  No documentation for ‘corners’ in specified packages and libraries:
    you could try ‘??corners’
  > ??corners
  > args(corners)
  Error: object 'corners' not found
  > args(round)
  function (x, digits = 0) 
    NULL
  > round(3.1415, digits=2)
  [1] 3.14
  > round(pie,digits=10)
  Error in round(pie, digits = 10) : 
    non-numeric argument to mathematical function
  > round(pi,digits=10)
  [1] 3.141593
  > round(e,digits=10)
  Error: object 'e' not found
  > #tip name arguments to make sure inputs are doing the right thing
    > #sample builds without replacement
    > sample(die,2)
  [1] 5 1
  > #^numbers will never be the same
    > sample(die,7)
  Error in sample.int(length(x), size, replace, prob) : 
    cannot take a sample larger than the population when 'replace = FALSE'
  > #can fix this using the replace= arg
    > sample(die,2,replace=true)
  Error: object 'true' not found
  > ample(die,2,replace=TRUE)
  Error in ample(die, 2, replace = TRUE) : could not find function "ample"
  > Sample(die,2,replace=true)
  Error in Sample(die, 2, replace = true) : 
    could not find function "Sample"
  > sample(die,2,replace=true)
  Error: object 'true' not found
  > sample(die,2,replace=TRUE)
  [1] 6 6
  > sample(die,8,replace=TRUE)
  [1] 2 1 6 1 3 6 5 1
  > #replacement=independent
    > dice= sample(die,2,replace=TRUE)
  > dice
  [1] 4 4
  > dice
  [1] 4 4
  > #only shows the one result, once you save results to an object they do not change
    > #write your own R function
    > roll()
  Error in roll() : could not find function "roll"
  > #just another type of R object, but instead of data its code
    > #Every function in R has three basic parts: a name, a body of code, and a set of arguments
    > roll <- function(){
      + die<-1:6
      + dice<-sample(die,2,replace=TRUE)
      + sum(dice)}
  > roll()
  [1] 8
  > roll()
  [1] 6
  > #think of () as the "trigger"
    > roll
  function(){
    die<-1:6
    dice<-sample(die,2,replace=TRUE)
    sum(dice)}
  <bytecode: 0x1109da000>
    > #ensure that your final line of code returns a value in the body of the function
    > roll2<- function(bones) {
      + dice<- sample(bones,size=2,replace=TRUE
                      + ) sum(dice)}
  Error: unexpected symbol in:
    "dice<- sample(bones,size=2,replace=TRUE
) sum"
  > roll2<- function(bones) {
    +     + dice<-sample(bones,size=2,replace=TRUE
                         +                     + ) sum(dice)}
  Error: unexpected ')' in:
    "    + dice<-sample(bones,size=2,replace=TRUE
                    + )"
  > roll2 <- function(bones)
    + {dice <- sample(bones,2,replace=TRUE) sum(dice)}
  Error: unexpected symbol in:
    "roll2 <- function(bones)
{dice <- sample(bones,2,replace=TRUE) sum"
  > roll2 <- function() {}
  > roll2 <- function() { dice <-sample(bones, size=2, replace=TRUE)sum(dice)}
  Error: unexpected symbol in "roll2 <- function() { dice <-sample(bones, size=2, replace=TRUE)sum"
  > roll2 <- function() {dice <-sample(bones, size=2, replace=TRUE) sum(dice)}
  Error: unexpected symbol in "roll2 <- function() {dice <-sample(bones, size=2, replace=TRUE) sum"
  > roll2 <- function() {dice <-sample(bones, size=2, replace=TRUE) 
  + sum(dice})
  Error: unexpected '}' in:
    "roll2 <- function() {dice <-sample(bones, size=2, replace=TRUE) 
sum(dice}"
  > roll2 <- function() {dice <-sample(bones, size=2, replace=TRUE) 
  + + sum(dice) }
  > roll2()
  Error in roll2() : object 'bones' not found
  > roll2(bones=1:7)
  Error in roll2(bones = 1:7) : unused argument (bones = 1:7)
  > roll2( bones = 1:4)
  Error in roll2(bones = 1:4) : unused argument (bones = 1:4)
  > roll2 <- function(bones) {dice <-sample(bones, size=2, replace=TRUE) 
  + + + sum(dice) }
  > roll2(bones=1:4)
  [1] 7
  > #can set default unless otherwise noted
    > roll2 <- function(bones=1:6) {dice <-sample(bones, size=2, replace=TRUE) 
    + + + + sum(dice) }
  > roll2()
  [1] 6
  > roll2(bones=1:2)
  [1] 2
  > roll2(bones=1:2)
  [1] 3
  > roll2(bones=1:2)
  [1] 2
  > roll2(bones=1:2)
  [1] 3
  > roll2(bones=1:2)
  [1] 4
  roll2
  >roll2
  roll2()
  install.packages("ggplot2")
  library("ggplot2")
qplot
#only need to install a package once, need to load it with library each time you use it
x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
x
## -1.0 -0.8 -0.6 -0.4 -0.2  0.0  0.2  0.4  0.6  0.8  1.0

y <- x^3
y
## -1.000 -0.512 -0.216 -0.064 -0.008  0.000  0.008
##  0.064  0.216  0.512  1.000

qplot(x, y)
x <- c(1, 2, 2, 2, 3, 3)
qplot(x, binwidth = 1)
#hard bracket[ includes number soft bracket( does not
x2 <- c(1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 4)
qplot(x2, binwidth = 1)
x3 <- c(0, 1, 1, 2, 2, 2, 3, 3, 4)
qplot(x3,binwidth=1)
rolls<-replicate(10,roll())
qplot(rolls,binwidth=1)
#get packages: http://cran.r-project.org/
#adjust probability by adding new argument to sample function
#help pages accessed using ? 
#can look up function by using ??keyword
