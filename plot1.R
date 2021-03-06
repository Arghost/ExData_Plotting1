# Code created by Arghost / RTorres

library(dplyr)

#1. Dplyr is used for easy management
#2. Functions used for better code management
#3. Process: Read txt file, filter, create plot

#Function to create first plot
plot_1 <- function(){
  #variable creation
  txt_gap <- as_tibble()
  #Reading file and filtering
  txt_gap <- load_Txt()
  
  if (nrow(txt_gap) > 0){
    png("plot1.png", width=480, height=480, bg="white")
    create_plot1(txt_gap)
    dev.off()
    return("Plot1 function completed correctly")
  }
  else {
    return("Plot1 function Failed")
  }
}
# Function to read txt file and filter by date
# process adds new column with datetime
load_Txt <- function(){
  
  txt_gap <- as_tibble()
  filepath <- "/household_power_consumption.txt"
  #Using dplyr fuctions for easy management
  txt_gap <- read.table(filepath, sep=";", header=TRUE, na.strings="?")
  txt_gap <- txt_gap %>% mutate(Date = strptime(Date, "%d/%m/%Y")) %>%
        filter(Date %in% c("2007-02-01", "2007-02-02"))
  
  return(txt_gap)
}
#Function to create Hist plot
create_plot1 <- function(dtf){
  hist(dtf$Global_active_power, main="Global Active Power",
       xlab="Global Active Power (kilowatts)", col="red")
}

#Call to process execution
plot_1()
