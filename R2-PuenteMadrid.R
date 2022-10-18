# Mirkka Jossette Puente Madrid
# October 18th, 2022

#Install packages (to be run first and one time only)
#install.packages("writexl")

#################### EXERCISES ###################
#1. Open the data frame in iris {datasets}. Use the help to know 
#about this data. In which units are measured the length and width 
#of sepals and petals? How many variables and observations are there
#in iris?

#Open the data frame
iris
data(iris)
#Help to know more about the data
help(iris)
#which units are measured the length and width of sepals and petals?
# Solution: centimeters
#How many variables and observations?
# Solution: observation = 150  and variables = 5

#2. Create a vector with the species names. Remember that genus should 
#be with capital letters and species in small letters 
#(e.g. “Iris setosa”).

#vector with species name only (use levels)
species_name <- levels(iris$Species)

#vector with genus and species
genus_species_name <- paste0("Iris ", species_name)

#3.Create a vector with the name of all quantitative variables

#names of columns
cols <- colnames(iris, do.NULL = TRUE, prefix = "col")

#select the quantitative variables
quantitative_variables <- cols[1:4]

#4. Make a data frame with the combination of the two previous vectors
#Repeat the names of the genus
a <- c(rep(genus_species_name[1], times = 4))
b <- c(rep(genus_species_name[2], times = 4))
c <- c(rep(genus_species_name[3], times = 4))

#create the vector with all of the vectors of repetition
all_genus_species <- c(a, b, c)

#create the vector with the quantitative vector repetition
all_quantitative_variables <- rep(quantitative_variables[1:4], 3)

#Create the data frame
data <- data.frame(all_genus_species, all_quantitative_variables)


#5. Using data frame from exercise 4, make a data frame with the following variables:

#Species.
#Variable.
#Mean, the mean for each variable and species.
#Standard_error, the standard error for each variable and species.
#Median, the median for each variable and species.
#Minimum, the minimum for each variable and species.
#Maximum, the maximum for each variable and species.

#Species
d0 <- data.frame(species=data$all_genus_species)

#Variables
d0$variables <- (data$all_quantitative_variables)

#Mean
########## FOR MYSELF ################
#Selecting setosa species only
#setosa <- iris$Species=="setosa"
#Mean of sepal length
#mean(iris$Sepal.Length[setosa])
#mean(iris[[1]][setosa])
#Mean of sepal width
#mean(iris$Sepal.Width[setosa])
#####################################

#Mean
#Empty vector for means
means <- c()
#For loops to get the mean
for (sp in levels(iris$Species)){
  for (i in 1:4){
    s <- iris$Species == sp
    means <- c(means,mean(iris[[i]][s]))
  }
}

#Adding the column mean to data.frame
d0$means <- (means)

#Standard_error, the standard error for each variable and species.
#N = number of observations
l <- length(iris$Species)

#empty vector to save standard_error
standard_errors <- c()

for (sp in levels(iris$Species)){
  for (i in 1:4){
    species <- iris$Species == sp
    s <- sd(iris[[i]][species])
    se <- s/(sqrt(l))
    standard_errors <- c(standard_errors,se)
  }
}

#Adding the column standard errors to data.frame
d0$standard_error <- standard_errors

#Median, the median for each variable and species.

#Empty vectors to keep medians
medians <- c()

for (sp in levels(iris$Species)){
  for (i in 1:4){
    species <- iris$Species == sp
    medians <- c(medians, median(iris[[i]][species]))
  }
}
#Adding the column medians to data.frame
d0$median <- medians

#Minimum, the minimum for each variable and species.
#Empty vector to keep minimums
mins <- c()

for (sp in levels(iris$Species)){
  for (i in 1:4){
    species <- iris$Species == sp
    mins <- c(mins, min(iris[[i]][species]))
  }
}

#Adding the column minimum to data.frame
d0$minimum <- mins


#Maximum, the maximum for each variable and species.
#Empty vector to keep maximums
maxs <- c()

for (sp in levels(iris$Species)){
  for (i in 1:4){
    species <- iris$Species == sp
    maxs <- c(maxs, max(iris[[i]][species]))
  }
}

#Adding the column maximum to data.frame
d0$maximum <- maxs

#6. Install the package “writexl” and use the command write_xlsx 
#to create a “yourname.xlsx” file with your data frame.

#Name of the file I want to create
p <- 'MirkkaPuente.xlsx'

#Actually create the excel file
#Running library
library(writexl)
write_xlsx(
  d0,
  path = tempfile(fileext = p),
  col_names = TRUE,
  format_headers = TRUE,
  use_zip64 = FALSE
)


