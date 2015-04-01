library(devtools)
install_github("assumednormal/bartMachine/bartMachine", local = FALSE)
library(bartMachine)

#get data and only use 2 factors
data(iris)
iris2 = iris[51:150,]
iris2$Species = factor(iris2$Species)

#build BART classification model
bart_machine = build_bart_machine(iris2[ ,1:4], iris2$Species)

##get estimated probabilities
phat = bart_machine$p_hat_train
##look at in-sample confusion matrix
bart_machine$confusion_matrix


.jmethods(bart_machine$java_bart_machine)
cat(.jcall(bart_machine$java_bart_machine, "S", "getDecisionRules", as.integer(1), as.integer(1)))


iris3 <- iris
iris3$Species <- factor(iris3$Species)
colnames(bartMachine:::pre_process_new_data(iris3[1 ,1:4], bart_machine))