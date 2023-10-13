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
codify=function (x, cols = 1:ncol(x), sep = "_") 
  as.matrix(cbind(Index = apply(x[, cols], 1, paste0, collapse = sep),  x[, -cols]))

c:
\
              library(readr)
              data <- read.csv("/Applications/NOAA_EcosystemData_10-6-2023.csv")
              View(data)

head(data)
length(data$spnm=="ATLANTIC MACKEREL")
data.frame(data[data$spnm=="ATLANTIC MACKEREL",])->atmac
typeof(atmac)
head(atmac)
#ag species density (EXPCATCHNUM) and biomass (EXPCATCHWT) by year
#-------------------
plot(atmac$GMT_YEAR,atmac$EXPCATCHWT,) 
plot(atmac$GMT_YEAR,atmac$EXPCATCHWT,)
atmac[2,]
atmac$GMT_YEAR=
AggCats="GMT_YEAR"
AggTarg=c("EXPCATCHWT",:"EXPCATCHNUM")
serialAgg(atmac, AggCats, AggTarg,)
function(x)
typeof(atmac$EXPCATCHWT)

?aggregate
aggregate(atmac$GMT_YEAR,by=c(atmac$EXPCATCHWT,atmac$EXPCATCHWT),mean)
aggregate(atmac$GMT_YEAR,atmac$EXPCATCHWT,mean)
#---------------------
aggatmac =serialAgg(atmac, "GMT_YEAR", c("EXPCATCHWT","EXPCATCHNUM"))

serialAgg(atmac, AggCats = c("GMT_YEAR", "latr"), AggTarg = "EXPCATCHWT")

aggatmac[ ,1]
#biomass by time
plot(aggatmac[ ,1],aggatmac[ ,2]) 
#density by time
plot(aggatmac[ ,1],aggatmac[ ,3])
typeof(aggatmac)
head(aggatmac)
#Activity 5
#"latr" which is the latitude column rounded
latitude=atmac[ ,6]
?round
?unique
round(atmac[ ,6])
unique(atmac$latr)
latr=NULL
atmac[latr]<-c(round(atmac[ ,6]))
#Use serialAgg to aggregate species biomass by year and latr. Call it YrSpaceWt
YrSpaceWt=serialAgg(atmac, AggCats = c("GMT_YEAR", "latr"), AggTarg = "EXPCATCHWT")
head(YrSpaceWt)
length(YrSpaceWt)
range(YrSpaceWt[ ,3])
#Plot a line graph of the species density in the first latitude bin (doesn't matter which) over time. When you do, specify the ylim values to be the range of weights in YrSpaceWt.
?plot
plot(aggatmac[ ,1],aggatmac[ ,3],type="l",ylim=range(YrSpaceWt))

is.atomic(aggatmac)

# first latitude bin
plot(YrSpaceWt[YrSpaceWt[ ,2] == 35, "GMT_YEAR"], YrSpaceWt[YrSpaceWt[ ,2] == 35, "EXPCATCHWT"],
     type = "l", xlim= c(1963,2021),ylim = c(range(YrSpaceWt[ ,3])))

plot(YrSpaceWt[YrSpaceWt[ ,2] == 36, "GMT_YEAR"], YrSpaceWt[YrSpaceWt[ ,2] == 36, "EXPCATCHWT"],
     type = "l", xlim= c(1963,2021),ylim = c(range(YrSpaceWt[ ,3])))

min(YrSpaceWt[ ,3]), max(YrSpaceWt[ ,3])
range(YrSpaceWt[ ,1])
unique_latr <- unique(atmac$latr)
lapply(unique_latr,sort)
uniqlat=unique_latr[order(unique_latr)]
plot(YrSpaceWt[YrSpaceWt[ ,2] == uniqlat[1], "GMT_YEAR"], YrSpaceWt[YrSpaceWt[ ,2] == uniqlat[1], "EXPCATCHWT"],
     type = "l", xlim= c(1963,2021),ylim = c(range(YrSpaceWt[ ,3])), xlab= "Year (1963-2021)", ylab="Biomass (expected catch weight)",)

#?lines()
for (i in 2:length(unique_latr)) {
  lines(YrSpaceWt[ ,1][YrSpaceWt[ ,2] == unique_latr[i]], 
        YrSpaceWt[ ,3][YrSpaceWt[ ,2] == unique_latr[i]], 
        type = "l",
        col = rainbow(length(unique_latr))[i])  
}

legend("topright", legend = unique_latr, col = rainbow(length(unique_latr)), lty = 1,cex=.8)
title("ATLANTIC MACKEREL BY LATITUDE\nBiomass by Year")

#Activity 6: Summarize Diff variables in the data

#Make histograms of the columns: GMT_YEAR, fall, STRATUM, SVSPP, doy, DECDEG_BEGLAT, DECDEG_BEGLON, EXPCATCHWT
?hist
head(data)
par(mfrow=c(3,3))
hist(data[ ,1],xl ab="GMT_YEAR",main =  "GMT_YEAR")
hist(data[ ,2],xlab="fall",main = "fall")
hist(data[ ,3],xlab="STRATUM",main = "STRATUM")
hist(data[ ,4],xlab="SVSPP",main =  "SVSPP")
hist(data[ ,5],xlab="doy",main = 'doy')
hist(data[ ,6],xlab="DECDEG_BEGLAT",main = "DECDEG_BEGLAT")
hist(data[ ,7],xlab="DECDEG_BEGLON",main = "DECDEG_BEGLON")
hist(data[ ,16],xlab="EXPCATCHWT",main = "EXPCATCHWT")

#Make plots of GMT_YEAR (x) versus (1) doy, (2) AVGDEPTH, (3) SVVESSEL, and (4) TOWDUR
par(mfrow=c(2,2))
plot(data[ ,1],data[ ,5])
plot(data[ ,1],data[ ,10])
plot(data[ ,1],data[ ,9])
plot(data[ ,1],data[ ,13])