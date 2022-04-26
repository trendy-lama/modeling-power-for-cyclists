###Finally, lets use stepwise selection to select the optimal model of lagged variables.

require(MASS)
min_model = lm(work_j ~ 1, data = power_curve)
max_model = formula(lm(work_j ~ lag1 + lag2 + lag3 + lag4 + lag5 + lag6 + lag7 + lag8 + lag9 + lag10 + lag11 + lag12 + lag13 + lag14 + lag15 + lag16 + lag17 + lag18 + lag19 + lag20 + lag21 + lag22 + lag23, data = power_curve))
best_model = step(min_model, direction = "both", scope = max_model)

###The optimal model includes all of the lagged variables. We can now use the autoregression model to make predictions.

require(caret)
cv = trainControl(method = "LOOCV")
model = train(work_j[24:47] ~ lag1[24:47] + lag2[24:47] + lag3[24:47] + lag4[24:47] + lag5[24:47] + lag6[24:47] + 
                lag7[24:47] + lag8[24:47] + lag9[24:47] + lag10[24:47] + lag11[24:47] + lag12[24:47] + lag13[24:47] + lag14[24:47] + 
                lag15[24:47] + lag16[24:47] + lag17[24:47] + lag18[24:47] + lag19[24:47] + lag20[24:47] + lag21[24:47] + lag22[24:47] + 
                lag23[24:47], data = fixed_power_curve, method = "lm", trControl = cv)

###stepwise selection

```{r}
require(MASS)
min_model = lm(work_j ~ 1, data = fixed_power_curve)
max_model = formula(lm(work_j ~ lag1 + lag2 + lag3 + lag4 + lag5 + lag6 + lag7 + lag8 + lag9 + lag10 + lag11 + lag12 + lag13 + lag14 + lag15 + lag16 + lag17 + lag18 + lag19 + lag20 + lag21 + lag22 + lag23, data = fixed_power_curve))
best_model = step(min_model, direction = "both", scope = max_model)
```