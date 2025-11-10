  # install caret
install.packages("caret", dependencies = TRUE)

  # read evals dataset
evals <- read.csv("/Users/teaganclark/Library/CloudStorage/OneDrive-SaintJoseph\'sUniversity/R\ Statistical\ Programming/evals.csv")

  # convert categorical variables to numerical w/ factor
rank <- as.factor(evals$rank)
ethnicity <- as.factor(evals$ethnicity)
gender <- as.factor(evals$gender)
language <- as.factor(evals$language)
cls_level <- as.factor(evals$cls_level)
cls_profs <- as.factor(evals$cls_profs)
pic_outfit <- as.factor(evals$pic_outfit)
pic_color <- as.factor(evals$pic_color)

  # split data into 80% test/20% training sets
set.seed(123)
train_index <- createDataPartition(evals$score, p = 0.8, list = FALSE)
train <- evals[train_index, ]
test <- evals[-train_index, ]

  # train a random forest model
model <- train(
  score ~ .,             # predict score using all other variables
  data = train,
  method = "rf",         # random forest
  preProcess = c("center", "scale"),  # standardize numeric variables
  trControl = trainControl(method = "cv", number = 5)  # 5-fold cross-validation
  )

print(model)

  # check variable importance
importance <- varImp(model)

print(importance)
