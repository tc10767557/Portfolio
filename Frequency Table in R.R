  # load evals
evals <- read.csv("/Users/teaganclark/Library/CloudStorage/OneDrive-SaintJoseph\'sUniversity/R\ Statistical\ Programming/evals.csv")

#1
  # create age variable
age <- evals$age

  # some statistics
summary(age)
sd(age)

  # histogram
hist(age,
     main = "Professor's Ages",
     xlab = "Age",
     col = "skyblue")


#2
  # create score variable
score <- evals$score

  # scatterplot
plot(x = score, 
     y = age,
     pch = 19,
     col = "darkgreen",
     main = "Evaluation Score vs Age of Professors",
     xlab = "Evaluation Score",
     ylab = "Age",
     xlim = c(1, 5),
     ylim = c(20, 80))
  
  # correlation coefficient
cor(score, age)


#3
  # create language variable
language <- evals$language

  # side-by-side boxplot
boxplot(score ~ language,
        col = c("orange", "lightblue"),
        main = "Evaluation Scores by Language",
        xlab = "Language",
        ylab = "Evaluation Score")

  # two histograms in the same window
par(mfrow = c(1, 2))  # set up graphics window
hist(score[language == "english"],
     col = "lightgreen",
     main = "Scores: English-Speaking Profs",
     xlab = "Score",
     xlim = c(1, 5),
     breaks = 10)

hist(score[language != "english"],
     col = "red",
     main = "Scores: Non-English-Speaking Profs",
     xlab = "Score",
     xlim = c(1, 5),
     breaks = 10)

par(mfrow = c(1,1))     # reset graphics layout

  # t.test for  significance
t.test(score ~ language)


#4
  #create gender variable
gender <- evals$gender

  # frequency table
gender_table <- table(gender)
print(gender_table)

  # bar plot of table
barplot(gender_table,
        col = c("pink", "skyblue"),
        main = "Distribution of Professors by Gender",
        xlab = "Gender",
        ylab = "Frequency")


#5
  # create variables
rank <- evals$rank
cls_level <- evals$cls_level
  
  # two-way table
rank_cls_table <- table(rank, cls_level)
print(rank_cls_table)

  # clustered bar plot
barplot(rank_cls_table,
        beside = TRUE,
        col = c("lightblue", "salmon", "lightgreen"),
        legend = rownames(rank_cls_table),
        main = "Professor Rank by Course Level",
        xlab = "Course Level",
        ylab = "Frequency")
