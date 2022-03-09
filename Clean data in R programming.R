data("airquality")
View(airquality)
#Clean N/A

library(tidyr)
clean <- drop_na(airquality)
str(clean)

#clean up data
clean$Month <- as.factor(clean$Month)
str(clean)

#binary clasifier
x<- mean(clean$Ozone)

# create new variable

clean$quality <- as.factor(ifelse(clean$Ozone < x, " bad ", " Good "))
str(clean$quality)
View(clean)

# create linear regression as lm

model <- lm(Ozone~Solar.R + Wind +Temp ,data=clean)
summary(model)
