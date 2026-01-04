library(mdhglm)

data("circuit")

circuit$A_factor <- factor(circuit$A)
circuit$B_factor <- factor(circuit$B)

table_circuit <- table(circuit$A_factor, circuit$B_factor)
print(table_circuit)

chi_test <- chisq.test(table_circuit)
print(chi_test)

print(chi_test$expected)
