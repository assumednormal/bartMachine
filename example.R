library(devtools)
install("/Users/assumednormal/Desktop/bartMachine/bartMachine/", local = FALSE)
library(bartMachine)

data(iris)
iris2 = iris[51:150,]
iris2$Species = factor(iris2$Species)
bart_machine = build_bart_machine(iris2[ ,1:4], iris2$Species)
phat = bart_machine$p_hat_train
bart_machine$confusion_matrix

.jmethods(bart_machine$java_bart_machine)

for(gibbs in 0:999) {
    for(tree in 0:49) {
        cat(.jcall(bart_machine$java_bart_machine, "S", "getDecisionRules", as.integer(gibbs), as.integer(tree)), "\n")    
    }
}