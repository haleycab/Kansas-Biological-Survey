?cbind
head(alldat0)
head(alldat)
#categorize environmental data columns
EnvtDatColumns=c("wtemp","stemp","zp","nao")
#take columns of only what we need & rename
MyData=cbind(spp=alldat[,"SVSPP"], pop=round(alldat[,"DECDEG_BEGLAT"]),yr=alldat[,"GMT_YEAR"], n=alldat[,"EXPCATCHWT"],alldat[,c(EnvtDatColumns,"fall","logn")])
head(MyDataAgg)

#FUNCTION
#evrn="none","noZP",or "all"
findR2values1=function(speciesnum,season,evrn,yearmin,yearmax,E){
  #choose to include ZP in environmental data columns or not
  if (evrn == "noZP") {
    EnvtDatColumns=c("wtemp","stemp","nao")
  }  else if (evrn == "all") {
    EnvtDatColumns=c("wtemp","stemp","zp","nao")
  } 
 
  #take columns of only what we need & rename
  MyData=cbind(spp=alldat[,"SVSPP"], pop=round(alldat[,"DECDEG_BEGLAT"]),yr=alldat[,"GMT_YEAR"], n=alldat[,"EXPCATCHWT"],alldat[,c(EnvtDatColumns,"fall","logn")])
  head(MyDataAgg)
  #select for a certain season
  
  if (season == "fall") {
    MyDataUse=MyData[MyData[,"fall"]==1,]
  } else if (season == "spring") {
    MyDataUse=MyData[MyData[,"fall"]==0,]
  } else if (season == "both") {
    MyDataUse=MyData[MyData[,"fall"]>=-1,]
  } else {
    stop("use 'fall' 'spring'or 'both")
  }
  #aggregate data by species, population, and year
  MyDataAgg=serialAgg(MyDataUse,AggCats=c("spp","pop","yr"))
  #AggCats are the columns that stay the same when aggregating
  
  #use popsFilterSimp to normalize data
  #if envtDrivers present, normalize environmental drivers by species
  myDataFiltered=popsFilterSimp(MyDataAgg,envtDrivers = EnvtDatColumns)
  if (evrn == "none"){
    myDataFiltered=popsFilterSimp(MyDataAgg)
  } else if (evrn == "all"){
    myDataFiltered=popsFilterSimp(MyDataAgg,envtDrivers = EnvtDatColumns)
  } else if (evrn == "noZP"){
    myDataFiltered=popsFilterSimp(MyDataAgg,envtDrivers = EnvtDatColumns)
  } else {
    stop("use 'none' 'all'or 'noZP")
  }
  #aggreg
  # get specific species data from MyDataFiltered in specific year range
  species=myDataFiltered[myDataFiltered[,"spp"]==speciesnum & myDataFiltered[,"yr"]%in%(yearmin:yearmax),]
  
  # make vector
  Rvalues=c(1,2,3,4,5,6)
  
  #for loop
  for(i in 1:E) {
    
    # a fitGP function for specific conditions
    fiti=fitGP(data = species, x = c("logn",EnvtDatColumns),y = "logn", pop = "pop", E=i, tau=1, 
               scaling = "none", predictmethod = "loo")
    
    #get R squared value
    Rvalues[i]=fiti$outsampfitstats[1]
  }
  #return R2 values
  Rvalues
}
#EXAMPLE findR2values1(speciesnum,season,evrn,yearmin,yearmax,E)
findR2values1(103,"fall","none",1977,2008,6)

SpeciesNamesCodes=unique(alldat0[DataEntriesUse,c("SVSPP","spnm")])
SpeciesNamesCodes[2]
myspecies=c(103,104,105,106,108,135,143,26)

#FUNCTION

matrixR2myspec=function(season,evrn,yearmin,yearmax,E){
  
  #Generate matrix for R2 values for myspecies
  speciesR2values1=matrix(nrow=8,ncol=6,byrow=TRUE)
  #for loop to input findR2values vectors into matrix for 8 species
  suppressWarnings({
    for(i in 1:8)
      speciesR2values1[i,]=findR2values1(myspecies[i],season,evrn,yearmin,yearmax,E)
  })
  rownames(speciesR2values1)=c("SUMMER FLOUNDER","FOURSPOT FLOUNDER","YELLOWTAIL FLOUNDER","WINTER FLOUNDER","WINDOWPANE","BLUEFISH","SCUP","LITTLE SKATE")
  #speciesR2values1[ ,7]==
  speciesR2values1
}
#EXAMPLE
matrixR2myspec("fall","none",1977,2008,6)

#write.csv(speciesR2values, "test.csv")

#write code to create column for best E in matrix
#name matrix generated for each spreadsheet item
#generate csv and paste in excel spreadsheet
#fill out drive spreadsheet w results




