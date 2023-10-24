
mfrow=c(3,3)
#“latr” 36, plot the species fall time series on a new plot. Make sure the x axis are years
#collect data on species
atmac=data.frame(data[data$spnm=="ATLANTIC MACKEREL",])
#sort through just fall(1) or spring(0) data
atmacfall=data.frame(atmac[atmac$fall==1,])
#aggregate data
YrSpaceWt=serialAgg(atmacfall, AggCats = c("GMT_YEAR", "latr"), AggTarg = "EXPCATCHWT")
#plot time series 
plot(YrSpaceWt[YrSpaceWt[ ,2] == 36, "GMT_YEAR"], YrSpaceWt[YrSpaceWt[ ,2] == 36, "EXPCATCHWT"],
     type = "l", xlim= c(1963,2021),ylim = c(range(YrSpaceWt[ ,3])))
#------------------------------------------------------------------------


generatereport <- function(species, season, latitude) {
  
  # Filter the data for the specified species
  specdata <- data[data$spnm == species,]
  
  # Filter data for the specified season (fall or spring)
  
   if (season == "fall") {
    specdata <- specdata[specdata$fall == 1,]
  } else if (season == "spring") {
    specdata <- specdata[specdata$fall == 0,]
  } else {
    stop("Invalid season. Please use 'fall' or 'spring'.")
  }

  #Create column for rounded latitude 
  specdata$latr <-c(round(specdata$DECDEG_BEGLAT))
  
  #Aggregate data and take the log of (1 + EXPCATCHWT)
  specdata$LogEXPCATCHWT <- log(1 + specdata$EXPCATCHWT)
  speciesagg <- serialAgg(specdata, AggCats = c("GMT_YEAR", "latr"), AggTarg = "LogEXPCATCHWT")
  
  # Plot time series for the specified latitude
  plot(speciesagg[speciesagg[,2] == latitude, "GMT_YEAR"], speciesagg[speciesagg[,2] == latitude, "LogEXPCATCHWT"],
       type = "l", xlim = c(1963, 2021), ylim = c(range(speciesagg[,3]))
  )
}

# Example usage:




YrSpaceWt=serialAgg(atmac, AggCats = c("GMT_YEAR", "latr"), AggTarg = "EXPCATCHWT")

atmac$LogEXPCATCHWT <- log(1 + atmac$EXPCATCHWT)
serialAgg(atmac, AggCats = c("GMT_YEAR", "latr"), AggTarg = "LogEXPCATCHWT")

head(data)
head(YrSpaceWt)




generatereport("LONGHORN SCULPIN", "fall", latitude ="40")



#---------------------------------------------------

generatereport <- function(species, season, latitude) {
  
  # Filter the data for the specified species
  specdata <- data[data$spnm == species,]
  
  # Filter data for the specified season (fall or spring)
  if (season == "fall") {
    specdata <- specdata[specdata$fall == 1,]
  } else if (season == "spring") {
    specdata <- specdata[specdata$fall == 0,]
  } else {
    stop("Invalid season. Please use 'fall' or 'spring'.")
  }
  
  #Create column for rounded latitude 
  specdata$latr <-c(round(specdata$DECDEG_BEGLAT))
  
  #Aggregate data and take the log of (1 + EXPCATCHWT)
  specdata$LogEXPCATCHWT <- log(1 + specdata$EXPCATCHWT)
  speciesagg <- serialAgg(specdata, AggCats = c("GMT_YEAR", "latr"), AggTarg = "LogEXPCATCHWT")
  
  # Plot time series for the specified latitude
  plot(speciesagg[speciesagg[,2] == latitude, "GMT_YEAR"], speciesagg[speciesagg[,2] == latitude, "LogEXPCATCHWT"],
       type = "l", xlim = c(1963, 2021), ylim = c(range(speciesagg[,3]))
  )
}

# Example usage:
generatereport("LONGHORN SCULPIN", "fall", latitude ="40")

