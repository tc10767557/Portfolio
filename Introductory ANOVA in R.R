#1

  # load ISwR
library(ISwR)
  # load vitcap
data(vitcap)
vital.capacity <- vitcap$vital.capacity

#1a
  # desc stats, mean, sd
summary(vital.capacity)
mean(vital.capacity)
sd(vital.capacity)

  # histogram
hist(vital.capacity, 
     main = "Histogram of Vital Capacity", 
     xlab = "Vital Capacity (liters)", 
     col = "lightblue")

#1b 
  # normality check
shapiro.test(vital.capacity)

#1c
  # hypothesis test
t.test(vital.capacity, mu = 4.7)

#1d
  # histogram w/ trendline at means to visualize results
hist(vital.capacity,
     main = "Histogram of Vital Capacity w/ Means",
     xlab = "Vital Capacity (liters)",
     col = "lightblue")
abline(v = 4.7,  col = "red")
abline(v = 4.47, col = "blue")
legend("topleft",
       legend = c("Hypothesized Mean", 
                  "Sample Mean"),
       col = c("red", "blue"),
       lty = 1)

#2

#2a
  # load and first rows
marketing_data <- read.csv("/Users/teaganclark/Library/CloudStorage/OneDrive-SaintJoseph\'sUniversity/R\ Statistical\ Programming/marketing_performance.csv")
head(marketing_data)

#2b 
boxplot(SalesLift ~ interaction(Strategy, Region),
        data = marketing_data,
        col = c("lightblue", "lightblue", "lightblue", 
                "lightgreen", "lightgreen", "lightgreen"),
        xlab = "Strategy and Region",
        ylab = "Sales Lift",
        main = "Sales Lift by Strategy and Region")

#2c
  # anova
anova_model <- aov(SalesLift ~ Strategy * Region, data = marketing_data)
summary(anova_model)

#2d
  # extract residuals
residuals_anova <- residuals(anova_model)
  # test for normality of residuals
shapiro.test(residuals_anova)

  # test for equal variances
bartlett.test(SalesLift ~ interaction(Strategy, Region), data = marketing_data)


#3
  # load dataset
data(iris)

# calculate mean Sepal.Length
mean_sepal <- mean(iris$Sepal.Length)
mean_sepal

# calculate virginica mean Sepal.Length 
mean_virginica <- mean(iris$Sepal.Length[iris$Species == "virginica"])
mean_virginica


#4
  # mean for each column
column_means <- apply(iris[, 1:4], 2, mean)
column_means
