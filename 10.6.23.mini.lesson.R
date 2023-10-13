Activiy 1: Aggregate in R
#used to compute summary statistics for subsets of the data
input types: data.frame() formula, or time series object
?aggregate()
df <- chickwts
head(df)
#when using agregate function for a data frame with different types of data, you need to specify. here there is two types, numerical and categorical
group_mean <- aggregate(df$weight, list(df$feed), mean)
group_mean <- aggregate(weight ~ feed, data = df, mean) # Equivalent
group_mean
#to modify columns
colnames(group_mean) <- c("Group", "Mean")
group_mean
#aggregate count
aggregate(chickwts$feed, by = list(chickwts$feed), FUN = length)
aggregate(weight ~ feed, data = chickwts, FUN = length) # Equivalent

#aggregate quantile 
install.packages("lubridate")
library("lubridate")
set.seed(1)
Dates <- seq(dmy("01/01/2014"), dmy("01/01/2015"), by = "day")
Return <- rnorm(length(Dates))

install.packages("xts")
library(xts)
tserie <- xts(Return, Dates)

head(tserie)
#aggregate quantiles by date, 5% and 95%
dat <- aggregate(tserie ~ month(index(tserie)), FUN = quantile,
                 probs = c(0.05, 0.95))
colnames(dat)[1] <- "Month"
dat
#aggregate by multiple columns in R
#new categorical variable
set.seed(1)

cat_var <- sample(c("A", "B", "C"), nrow(df), replace = TRUE)
df_2 <- cbind(df, cat_var)
head(df_2)

aggregate(df_2$weight, by = list(df_2$feed, df_2$cat_var), FUN = sum)

# Equivalent to:
aggregate(weight ~ feed + cat_var, data = df_2, FUN = sum)

set.seed(1)

num_var <- rnorm(nrow(df))

df_3 <- cbind(num_var, df)

head(df_3)
#can use cbind function to conctenate multiple numerical variables
aggregate(cbind(df_3$num_var, df_3$weight), list(df_3$feed), mean)
#statistical summary created based on factor

Activity 2
serialAgg=function (x, AggCats, AggTarg = NULL, FUN = function(x) mean(x, na.rm = TRUE)){
  if (is.null(AggTarg)) {
    if (is.numeric(AggCats)) 
      AggTarg = (1:ncol(x))[-AggCats]
    if (is.character(AggCats)) 
      AggTarg = colnames(x)[!colnames(x) %in% AggCats]
  }
  Numbers = prod(apply(t(t(x[, AggCats])), 2, is.numeric))
  ncat = length(AggCats)
  if (ncat == 1) 
    Cats = as.character(x[, AggCats])
  else Cats = codify(x[, AggCats])
  agged = as.matrix(aggregate(x[, AggTarg], by = list(Cats), FUN = FUN))
  if (ncat > 1) 
    agged = cbind(matrix(unlist(strsplit(agged[, 1], 
                                         "_")), ncol = ncat, byrow = TRUE), matrix(agged[, 
                                                                                         -1], ncol = ncol(agged) - 1))
  if (Numbers) 
    agged = t(apply(agged, 1, as.numeric))
  colnames(agged) = colnames(cbind(x[, c(AggCats[1], AggCats)], 
                                   x[, c(AggTarg, AggTarg[1])]))[c(1, 3:(ncol(agged) + 1))]
  agged
}

