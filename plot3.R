# Code created by Arghost / RTorres

library(dplyr)

#1. Dplyr is used for easy management
#2. Functions used for better code management
#3. Process: Read txt file, filter, create plot

#Function to create first plot
plot_3 <- function(){
  #variable creation
  txt_gap <- as_tibble()
  #Reading file and filtering
  txt_gap <- load_Txt()
  
  if (nrow(txt_gap) > 0){
    png("D:/4- Courses/1- Coursera/4- Exploratory Data Analysis/Week1/ExData_Plotting1/plot3.png", width=480, height=480, bg="white")
    create_plot3(txt_gap)
    dev.off()
    return("Plot3 function completed correctly")
  }
  else {
    return("Plot3 function Failed")
  }
}
# Function to read txt file and filter by date
# process adds new column with datetime
load_Txt <- function(){
  
  txt_gap <- as_tibble()
  filepath <- "D:/4- Courses/1- Coursera/4- Exploratory Data Analysis/Week1/household_power_consumption.txt"
  #Using dplyr fuctions for easy management
  txt_gap <- read.table(filepath, sep=";", header=TRUE, na.strings="?")
  txt_gap <- txt_gap %>% mutate(dtime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")) %>%
    mutate(Date = strptime(Date, "%d/%m/%Y")) %>%
    filter(Date %in% c("2007-02-01", "2007-02-02"))
  
  return(txt_gap)
}
#Function to create plot
create_plot3 <- function(dtf){
  plot(dtf$dtime,
       dtf$Sub_metering_1,
       type = "l",
       ylab = "Energy sub metering",
       xlab = "")
  
  points(dtf$dtime,dtf$Sub_metering_2,type = "l",col="red")
  points(dtf$dtime,dtf$Sub_metering_3,type = "l",col="blue")
  legend("topright", lty = 1, 
         col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

#Call to process execution
plot_3()