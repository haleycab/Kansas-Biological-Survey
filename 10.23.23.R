
par(mfrow=c(3,3))
#New function
generatenewreport <- function(species, season, latitude, add_lines = FALSE) {
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
  
  # Create a column for rounded latitude 
  specdata$latr <- round(specdata$DECDEG_BEGLAT)
  
  # Aggregate data and take the log of (1 + EXPCATCHWT)
  specdata$LogEXPCATCHWT <- log(1 + specdata$EXPCATCHWT)
  speciesagg <- serialAgg(specdata, AggCats = c("GMT_YEAR", "latr"), AggTarg = "LogEXPCATCHWT")
  
  if (!add_lines) {
    # If add_lines is FALSE, create a new plot
    plot(speciesagg[speciesagg[,2] == latitude, "GMT_YEAR"], speciesagg[speciesagg[,2] == latitude, "LogEXPCATCHWT"],
         type = "l", xlim = c(1963, 2021), ylim = c(0,max(speciesagg[,3])), ylab = species, xlab = "Year", lwd=2,main = paste("Latitude:", latitude)
    )
  } else {
    # If add_lines is TRUE, add lines to an existing plot
    lines(speciesagg[speciesagg[,2] == latitude, "GMT_YEAR"], speciesagg[speciesagg[,2] == latitude, "LogEXPCATCHWT"], col = "red", type = "l",lwd=2
          )
  }
# Add dashed line at year 2007.5
  abline(v=2007.5,col=4,lty=2)
}


generatenewreport("BLUEFISH", "fall", 44, add_lines = FALSE)  # Create a new plot
generatenewreport("BLUEFISH", "spring", 44, add_lines = TRUE)   # Add lines to an existing plot


