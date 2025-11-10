#1
  # load
data <- read.csv("/Users/teaganclark/Library/CloudStorage/OneDrive-SaintJoseph\'sUniversity/R\ Statistical\ Programming/campaign_conversion_rates.csv")
  # structure
summary(data)
  # first rows
head(data)

#2
conversion <- data$ConversionRate
channel <- factor(data$Channel)
segment <- factor(data$Segment)
  # overall mean/sd
mean(conversion)
sd(conversion)
  # mean/sd by channel/segment
tapply(conversion, channel, mean)
tapply(conversion, channel, sd)

tapply(conversion, segment, mean)
tapply(conversion, segment, sd)
  # mean/sd 3x2 combinations
with(data, tapply(conversion, list(channel, segment), mean))
with(data, tapply(conversion, list(channel, segment), sd))


#3
  # boxplot
boxplot(conversion ~ channel, data = data,
        main = "ConversionRate by Salary", ylab = "Conversion Rate (in %)")
  # interaction plot
with(data,
     interaction.plot(x.factor = channel, trace.factor = segment,
                      response = conversion, fun = mean,
                      ylab = "Conversion Rate", xlab = "Channel",
                      main = "Interaction Plot: Channel x Segment"))

#4 
  # fit aov
anova <- aov(conversion ~ channel * segment, data = data)
  # anova table
summary(anova)

#5
  # get normality of residuals
shapiro.test(resid(anova))
  # homogeneity of variances
bartlett.test(conversion ~ interaction(channel, segment), data = data)