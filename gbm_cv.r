set.seed(91319)
train_control <- trainControl(method="cv", number=10, savePred=T)

gbm_cv.mod <- train(class~., data=pml.training, method="gbm", trControl=train_control)
saveRDS(gbm_cv.mod, file="data/gbm_cv.rds")
summary(gbm_cv.mod)
varImp(gbm_cv.mod)

predictions <- predict(gbm_cv.mod, newdata=pml.training)
confusionMatrix(predictions, pml.training$class)
