# Mirkka Jossette Puente Madrid
# October 18th, 2022

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

#vector with species name only
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
d0 <- data.frame(data$all_genus_species)

#Variable
d0$variables <- (data$all_quantitative_variables)

#Mean
#Selecting setosa species only
setosa <- iris$Species=="setosa"
#Mean of sepal length
mean(iris$Sepal.Length[setosa])
mean(iris[[1]][setosa])
#Mean of sepal width
mean(iris$Sepal.Width[setosa])

#Empty vector for means
means <- c()
for (sp in levels(iris$Species)){
  for (i in 1:4){
    s <- iris$Species == sp
    means <- c(means,mean(iris[[i]][s]))
  }
}

d0$means <- (means)



