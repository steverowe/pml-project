set.seed(91316)

rf.mod <- train(class~., data=training, method="rf")
saveRDS(rf.mod, file="data/randomforest.rds")
summary(rf.mod)
varImp(rf.mod)

predictions <- predict(rf.mod, newdata=testing)
confusionMatrix(predictions, testing$class)

probs <- predict(rf.mod, newdata=testing, type="prob")

