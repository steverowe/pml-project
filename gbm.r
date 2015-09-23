set.seed(91318)
gbm.mod <- train(class~., data=training, method="gbm")
saveRDS(gbm.mod, file="data/gbm.rds")
summary(gbm.mod)
varImp(gbm.mod)

predictions <- predict(gbm.mod, newdata=testing)
confusionMatrix(predictions, testing$class)
