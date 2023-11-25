# Basic R Syntax and Commands

# Variables and data types

patient_id <- "P001"  # Character type
smoker <- TRUE       # Logical type
age <- 30 #Numeric type

someMatrix <- matrix(1:9, nrow=3)

someList <- list(age, patient_id, smoker)

data_frame <- data.frame(ID=c(1,2), Name=c("Alice", "Bob"))

#___________________________________________________________________

# Loading the dataset
cvd_data <- read.csv("dataCVD.csv")
head(cvd_data)

#____________________________________________________________________

#Data Manipulation / Cleaning

# Convert character columns to numeric, unable to convert in excel :()
cvd_data$BMI<- as.numeric(as.character(cvd_data$BMI))
cvd_data

# Check for NAs
na_count_per_column <- sapply(cvd_data, function(x) sum(is.na(x)))
na_count_per_column

# Handling missing values
cvd_data$BMI[is.na(cvd_data$BMI)] <- mean(cvd_data$BMI, na.rm = TRUE)
cvd_data #recheck for columns with NAs with above code

# cvd_data$age: This is accessing the age column of the cvd_data data frame.
# is.na(cvd_data$age): This checks for NA values (missing values) in the age 
# column.
# mean(cvd_data$age, na.rm = TRUE): This calculates the mean of the age column 
# while ignoring NA values (na.rm = TRUE).

# cvd_data$age[is.na(cvd_data$age)] <- ...: This is attempting to replace all 
# NA values in the age column with the mean age.


# Data transformation
cvd_data$age_group <- ifelse(cvd_data$AGE > 50, 
                             "Above 50", 
                             "50 or Below")
cvd_data

#__________________________________________________________________________

#Exploratory Data Analysis

str(cvd_data) #structure of the data
head(cvd_data) # First 6 rows

#________________________________________________________________________

# Basic Data Analysis

# Descriptive statistics
summary(cvd_data$TOTCHOL)

# Simple visualizations
hist(cvd_data$AGE, col= 'blue')

# Basic Boxplot
boxplot(cvd_data$BMI, main = "Boxplot of BMI", ylab = "Value")

# Scatter plot
length(cvd_data$age)
length(cvd_data$TOTCHOL)

plot(cvd_data$AGE, cvd_data$TOTCHOL)

#______________________________________________________

# Using packages for Data Manipulation and Visualizations

# dplyr and ggplot2
library(dplyr)
library(ggplot2)


# Data manipulation with dplyr
cvd_data <- cvd_data %>%
  filter(AGE > 18) %>%
  arrange(desc(TOTCHOL))

cvd_data
# cvd_data <- ...: This part is reassigning the result of the operations back 
# to the cvd_data variable. It's updating cvd_data with the new modified data frame.

# %>%: This is the pipe operator from the magrittr package, commonly used in 
# dplyr. It allows you to pass the result of one function directly into the 
# next function, making the code more readable and reducing the need for 
# intermediate variables.

# filter(AGE > 18):
# filter() is a dplyr function used to subset rows based on a particular condition.
# AGE > 18 is the condition being applied. This line will keep only the rows 
# where the value of the AGE column is greater than 18.

# arrange(desc(TOTCHOL)):
# arrange() is another dplyr function used to sort a data frame.
# desc(TOTCHOL) indicates that the sorting is to be done on the TOTCHOL 
# column in descending order (desc stands for 'descending').


# Advanced visualizations with ggplot2
ggplot(cvd_data, aes(x=AGE, y=TOTCHOL)) +
  geom_point() +
  labs(title="Age vs Total Cholesterol", x="Age", y="Total_Choles")


