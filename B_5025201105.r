
install.packages("BSDA")
library(BSDA)
# NO. 1
x = c(78,75,67,77,70,72,78,74,77)
y = c(100,95,70,90,90,90,89,90,100)

# A. mencari standar deviansi
standar_deviansi = sd(x-y)
standar_deviansi
# [1] 6.359595

# B. nilai t (p-value)
t.test(x-y, mu = mean(x-y))

# C. 
t.test(x, y, alternative = 'two.sided', mu = 0, paired = TRUE)

# NO. 2
zsum.test(alternative = "greater", conf.level = 0.95, n.x = 100, mean.x = 23500, sigma.x = 3900, mu = 20000)

# NO. 3

# NO. 4
dataset = read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"))
dataset$JENIS = as.factor(dataset$V1)
dataset$JENIS = factor(dataset$JENIS, labels = c("grup 1", "grup 2", "grup 3", "grup 4"))

# A. Buatlah masing masing jenis spesies menjadi 3 subjek. Lalu Gambarkan plot kuantil normal untuk setiap kelompok
# lihat apakah ada outlier utama dalam homogenitas varians.
grup_1 = subset(dataset, JENIS == "grup 1")
grup_2 = subset(dataset, JENIS == "grup 2")
grup_3 = subset(dataset, JENIS == "grup 3")